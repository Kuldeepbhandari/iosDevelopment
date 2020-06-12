//
//  ViewController.swift
//  CollectionViewAddImage
//
//  Created by mac on 11/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageCollectionCell: ImageCollectionCell!
    @IBOutlet weak var addBtnCollectionCell: AddBtnCollectionViewCell!
    
    var imageArr : [UIImage] = []
  //  let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}


extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = imageArr.count
        
        if count == 0{
            return 1
        }else{
            return imageArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddBtnCollectionViewCell", for: indexPath) as! AddBtnCollectionViewCell
        cell.addBtn.addTarget(self, action: #selector(openPhotoPickerView), for: .touchUpInside)

        return cell
        
    }
    
    
    @objc func openPhotoPickerView() {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.isEditing = true
        myImagePickerController.delegate = self
        myImagePickerController.sourceType = .photoLibrary
        self.present(myImagePickerController, animated: true, completion: nil)
    }
}


extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    if let editedImage = info[.editedImage] as? UIImage{
       // self.imageView.image = editedImage
        imageArr.append(editedImage)
        collectionView.reloadData()
    }else if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
       // self.imageView.image = image
        self.imageArr.append(image)
        collectionView.reloadData()
    }
    dismiss(animated: true, completion: nil)
}
}
