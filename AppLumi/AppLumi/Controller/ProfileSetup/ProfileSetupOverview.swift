//
//  ProfileSetupOverview.swift
//  AppLumi
//
//  Created by appinventiv on 31/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class ProfileSetupOverview: UIViewController {
    
    @IBOutlet var informationView: InformationView!
    @IBOutlet var setTitle: SetTitle!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var yearText: UITextField!
    @IBOutlet var monthTextField: UITextField!
    @IBOutlet var dateText: UITextField!
    @IBOutlet var nameText: UITextField!
    
    //    MARK:Variables
    let datePicker = UIDatePicker()
    var selectedGender:Gender?
    var selectImageArr = [UIImage]()
    var selectImage = Int()
    var pickedImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setTitle.backBtn.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
        implementDatePicker()
        informationView.profileImage.image = #imageLiteral(resourceName: "icProfileSetupOverviewActive")
    }
    
    
    func implementDatePicker(){
        datePicker.addTarget(self, action: #selector(openDatePicker(_ :)), for: .valueChanged)
        //        Toolbaar
        let toolbaar = UIToolbar()
        toolbaar.sizeToFit()
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneBtnTapped))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let canelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelBtnTapped))
        toolbaar.setItems([doneBtn,spaceButton,canelBtn], animated: false)
        yearText.inputAccessoryView = toolbaar
        dateText.inputAccessoryView = toolbaar
        monthTextField.inputAccessoryView = toolbaar
        yearText.inputView = datePicker
        dateText.inputView = datePicker
        monthTextField.inputView = datePicker
    }
    
    @objc func openDatePicker(_ sender:UIDatePicker){
        datePicker.datePickerMode = .date
        let calender = Calendar(identifier: Calendar.Identifier.gregorian)
        var minDateComponent = calender.dateComponents([.day,.month,.year], from: Date())
        minDateComponent.day = 1
        minDateComponent.month = 1
        minDateComponent.year = 1960
        let minDate = calender.date(from: minDateComponent)
        var maxDateComponent = calender.dateComponents([.day,.month,.year], from: Date())
        maxDateComponent.day = 1
        maxDateComponent.month = 1
        maxDateComponent.year = 2002
        let maxDate = calender.date(from: maxDateComponent)
        self.datePicker.minimumDate = minDate
        self.datePicker.maximumDate = maxDate
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        //  2018/11/30 YYYY//DD//MM
        formatter.locale = Locale(identifier: "ja_JP")
        let selectDate = formatter.string(from: datePicker.date)
        print(selectDate)
        let dateArr = selectDate.components(separatedBy: "/")
        let year = dateArr[0]
        let date = dateArr[1]
        let month = dateArr[2]
        yearText.text = year
        dateText.text = date
        monthTextField.text = month
    }
    
    @objc func doneBtnTapped(){
        self.view.endEditing(true)
    }
    
    @objc func  cancelBtnTapped(){
        self.view.endEditing(true)
    }
    @objc func popViewController(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectGenderBtnTapped(_ sender: UIButton) {
        if sender.tag == 1{
            selectedGender = .Male
        }else if sender.tag == 2{
            selectedGender = .Female
        }else if sender.tag == 3{
            selectedGender = .Others
        }
    }
    
    @IBAction func nextBtnWasPressed(_ sender: UIButton) {
        
        guard let userName = nameText.text , nameText.text != nil else {return}
        guard let month = monthTextField.text , monthTextField.text != nil else {return}
        guard let day = dateText.text , dateText.text != nil else {return}
        guard let year = yearText.text , yearText.text != nil else {return}
        guard let gender = selectedGender?.rawValue else {return}
        let dob = "\(month)-\(day)-\(year)"
        AuthServices.instance.registerUser(userName: userName, gender: gender, dob: dob) { (sucess) in
            if sucess{
                guard let setupLocationVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileSetupLocation") as? ProfileSetupLocation else {return}
                self.navigationController?.pushViewController(setupLocationVC, animated: false)
            }
        }
    }
}
//MARK:Uicollection view delegate and datasource method
extension ProfileSetupOverview:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectImage = selectImageArr.count == 0 ?  1 : selectImageArr.count
        return selectImage
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileSetupCell", for: indexPath) as? ProfileSetupCell{
            if selectImageArr.count == 0{
                cell.addImageBtn.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
                return cell
            }else{
                cell.profileImage.image = selectImageArr[indexPath.row]
                cell.addImageBtn.addTarget(self, action: #selector(openGallery), for: .touchUpInside)
                return cell
            }
        }
        else{
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns : CGFloat = 2
        if UIScreen.main.bounds.width > 320 {
            numOfColumns = 3
        }
        let spaceBetweenCells : CGFloat = 15
        let padding : CGFloat = 20
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
    @objc func openGallery(){
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.allowsEditing = true
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imageController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imageController.modalPresentationStyle = .popover
        self.present(imageController, animated: true, completion: nil)
    }
}


extension ProfileSetupOverview:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImages = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickedImage = pickedImages
            
            selectImageArr.append(pickedImage)
            
            groupProfile { (sucess) in
                if sucess{
                    print("image is upload")
                }
            }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func groupProfile(completion:@escaping CompletionHandler){
        AF.upload(multipartFormData: { multipartFormData in
            
//            let jpegData = self.pickedImage.jpegData(compressionQuality: 1.0)
//            let parameter : [String:Any] = [ "avatar" : jpegData]

//            for (key, value) in parameter
//               {
//                multipartFormData.append(((value) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
//               }
            
             //   multipartFormData.append(Data((jpegData)!), withName: "filename")
            if let jpegData = self.pickedImage.jpegData(compressionQuality: 1.0) {
                    multipartFormData.append(jpegData, withName: "avatar", fileName: "avatar", mimeType: "image/jpeg")
                }
        }, to: SAVE_IMAGE_ON_SERVER_URL,method: .post, headers: HEADER)
            .responseData { response in
                if response.response?.statusCode == 200 {
                    print("OK. Done")
                }
        }
    
    }
}
