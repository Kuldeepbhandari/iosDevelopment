//
//  LoginPageVC+ImagePickerExtension.swift
//  Employee Record System
//
//  Created by appinventiv on 25/02/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import  UIKit


//MARK:Confirm Protocol For Present ViewController

extension LoginPageVC:PresentViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    //    MARK:This function is used to open action sheet when i tap on image
    internal func presentViewController() {
        //           MARK: This block  is used for remove and update the image
        if alertOpen{
            let removePhotoAlert = UIAlertController(title: "Choose Image From", message: "", preferredStyle: .actionSheet)
            removePhotoAlert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (gallery) in
                let imageController = UIImagePickerController()
                imageController.delegate = self
                imageController.allowsEditing = false
                imageController.sourceType = .photoLibrary
                imageController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                imageController.modalPresentationStyle = .popover
                self.present(imageController, animated: true, completion: nil)
            }))
            removePhotoAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: nil))
            removePhotoAlert.addAction(UIAlertAction(title: "Remove Photo", style: .default, handler: { (removePhoto) in
                self.removeImage = true
                self.isPickImage = false
                self.tableView.reloadData()
            }))
            removePhotoAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(removePhotoAlert, animated: true, completion: nil)
        }
//MARK:This block is used for select the image from gallery
        else{
            let alert = UIAlertController(title: "", message: "Choose Image From", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            }))
            alert.addAction(UIAlertAction(title: "Photo Libaray", style: .default, handler: { (imagePicker) in
                let imageController = UIImagePickerController()
                imageController.delegate = self
                imageController.allowsEditing = false
                imageController.sourceType = .photoLibrary
                imageController.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                imageController.modalPresentationStyle = .pageSheet
                self.present(imageController, animated: false, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false, completion: nil)
            
            
            
        }
    }
    //    MARK:This function is called when i select image from Gallery
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        isPickImage = true
        chooseImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
}
