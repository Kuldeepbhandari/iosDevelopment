//
//  MyProfileVC.swift
//  AppLumi
//
//  Created by appinventiv on 17/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit
import Alamofire

class MyProfileVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var lblDrugs: UILabel!
    @IBOutlet var lblMarijuna: UILabel!
    @IBOutlet var lblAlcohol: UILabel!
    @IBOutlet var lblCigarette: UILabel!
    @IBOutlet var lblpolticalLeaning: UILabel!
    @IBOutlet var religiousLbl: UILabel!
    @IBOutlet var ageLbl: UILabel!
    @IBOutlet var lblIntersted: UILabel!
    @IBOutlet var educationLbl: UILabel!
    @IBOutlet var workLabel: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var geminiLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var lblUserEmail: UILabel!
    @IBOutlet var lblUserName: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    //    MARK:Variables
    var feet:Int?
    var inch:Int?
    var minimumAge:Int?
    var maximumAge:Int?
    var question:String?
    var answer:String?
    var selectImage = Int()
    var getQuestionArr : [GetQuestions] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    var downloadImage : UIImage?
    var pickedImage = UIImage()
    
    // var imageArr = [UIImage]()
    var selectImageArr = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initalSetupViews()
    }
    
    func initalSetupViews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        getUserInfo { (sucess) in
            if sucess{
                print("We get the information from server")
                
                self.tableView.reloadData()
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
        getImageFromServer { (sucees) in
            if sucees{
                print("ok")
            }
        }
        print(getQuestionArr)
    }
    
    @IBAction func openWelcomePage(_ sender: UIButton) {
        
        guard let menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as? MenuVC else {return}
        self.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    //
    func getImageFromServer(completion:CompletionHandler){
        let url = URL(string: "http://3.92.170.227:7008/pic1.jpg")
        AF.request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: HEADER).responseData { (response) in
            print(response)
            if response.error == nil{
                guard let data = response.data else {return}
                print(data)
                self.downloadImage = UIImage(data: data)
                self.collectionView.reloadData()
            }
        }
    }
    
    
    
    func getUserInfo(completion:@escaping CompletionHandler){
        AF.request(GET_PROFILE_USER_URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.error == nil{
                guard let json = response.value as? Dictionary<String,Any> else {return}
                guard let data = json["data"] as? Dictionary<String,Any> else {return}
                print(data)
                let alocholInfo = data["alcohol_info"] as? String
                self.lblAlcohol.text = alocholInfo
                let bioArr = data["bio"] as! [Dictionary<String,Any>]
                for item in bioArr{
                    self.question = item["question"] as? String ?? ""
                    self.answer = item["answer"] as? String ?? ""
                    
                    let getQuestion = GetQuestions(question: self.question ?? "", answer: self.answer ?? "", Q_id: 0)
                    self.getQuestionArr.append(getQuestion)
                }
                print(self.getQuestionArr.count)
                
                let ciggrate = data["cigarettes_info"] as? String
                self.lblCigarette.text = ciggrate
                let drugsInfo = data["drug_info"] as? String
                self.lblDrugs.text = drugsInfo
                let email = data["email"] as? String
                self.lblUserEmail.text = email
                let gender = data["gender"] as? String
                self.genderLabel.text = gender
                let heightArr = data["height"] as! Dictionary<String,Any>
                self.heightLbl.text = "\(String(describing: heightArr["feet"]!)) - \(String(describing: heightArr["inches"]!))"
                let education = data["highest_education"] as? String
                self.educationLbl.text = education
                let interstedAge = data["interested_age"] as! Dictionary<String,Any>
                self.ageLbl.text = "\(String(describing: interstedAge["min_age"]!)) - \(String(describing: interstedAge["max_age"]!))"
                let interstedGender = data["interested_gender"] as? String
                self.lblIntersted.text = interstedGender
                let jobTitle = data["jobTitle"] as? String
                self.workLabel.text = jobTitle
                let marijunaInfo = data["marijuana_info"] as? String
                self.lblMarijuna.text = marijunaInfo
                let politicalLeaning = data["political_learnings"] as? String
                self.lblpolticalLeaning.text = politicalLeaning
                let religion = data["religion"] as? String
                self.religiousLbl.text = religion
                let userName = data["userName"] as? String
                self.lblUserName.text = userName
                
                let userUploads = data["userUploads"] as! [Dictionary<String,Any>]
                
//                for  key in userUploads{
//                    let imageName = userUploads["path"] as? String ?? ""
//
//                }
                print(userUploads)
                // print(self.imageArr.count)
                print(response)
                completion(true)
            }else{
                completion(false)
            }
        }
    }
    
    @IBAction func editUserEmailBtnWasPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func viewProfileAsOthersBtnWasPressed(_ sender: UIButton) {
        
        
    }
}


extension MyProfileVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectImage = selectImageArr.count == 0 ?  1 : selectImageArr.count
        return selectImage
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyProfileCell", for: indexPath) as? MyProfileCell {
            if selectImageArr.count == 0{
                cell.addImageBtn.addTarget(self, action: #selector(openPhotoPickerView), for: .touchUpInside)
                return cell
            }else{
                cell.profileImage.image = selectImageArr[indexPath.row]
                cell.addImageBtn.addTarget(self, action: #selector(openPhotoPickerView), for: .touchUpInside)
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
    

    @objc func openPhotoPickerView() {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.isEditing = true
        myImagePickerController.delegate = self
        myImagePickerController.sourceType = .photoLibrary
        self.present(myImagePickerController, animated: true, completion: nil)
    }
    
}

//MARK:Uitable view datasource and delegate method

extension MyProfileVC:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getQuestionArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTableCell", for: indexPath) as? MyProfileTableCell else {return UITableViewCell()}
        cell.questionLbl.text = getQuestionArr[indexPath.row].question
        cell.answerLbl.text = getQuestionArr[indexPath.row].answer
        return cell
    }
}

//MARK:Uiimage pickercontroller delegate method

extension MyProfileVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImages = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            pickedImage = pickedImages
            selectImageArr.append(pickedImage)
            self.collectionView.reloadData()
            dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    }
    
}
