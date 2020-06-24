//
//  AddProfilePhotoVC.swift
//  AppLumi
//
//  Created by Kuldeep Singh on 04/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class AddProfilePhotoVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var profileImageArr = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(UINib(nibName: "AddProfileImageCell", bundle: nil), forCellWithReuseIdentifier: "AddProfileImageCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    
}

extension AddProfilePhotoVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = profileImageArr.count == 0 ? 1 : (profileImageArr.count+1)
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = indexPath.row
        guard let addBtnCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddProfileButtonCell", for: indexPath) as? AddProfileButtonCell else {return UICollectionViewCell()}
        if profileImageArr.count == 0 && indexPath.row == 0{
            
            addBtnCell.addImageBtn.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
            return addBtnCell
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddProfileImageCell", for: indexPath) as? AddProfileImageCell else {return UICollectionViewCell()}
        cell.profileImage.image = #imageLiteral(resourceName: "_111269013_pub_pour")
        
        return cell
    }
    
    
    @objc func openImagePicker(){
        let imageController = UIImagePickerController()
        imageController.allowsEditing = true
        imageController.delegate = self
        imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imageController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imageController.modalPresentationStyle = .popover
        self.present(imageController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numOfColumns : CGFloat = 2
        
        let spaceBetweenCells : CGFloat = 15
        let padding : CGFloat = 20
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
}

//MARK:UiimagePicker controller delegate and datasoucre method

extension AddProfilePhotoVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImages = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImageArr.append(pickedImages)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
