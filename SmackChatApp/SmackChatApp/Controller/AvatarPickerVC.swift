//
//  AvatarPickerVC.swift
//  SmackChatApp
//
//  Created by mac on 29/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController {

    
//    OUtlets
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
//    MARK:Varibales
    var avatarType = AvatarType.Dark
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func backBtnTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func valueChangeSegmentControl(_ sender: UIButton) {
        if segmentControl.selectedSegmentIndex == 0{
            avatarType = .Dark
        }else{
            avatarType = .Light
        }
        collectionView.reloadData()
    }
    
}


extension AvatarPickerVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var numOfColumns : CGFloat = 3
        if UIScreen.main.bounds.width > 375 {
            numOfColumns = 4
        }
        
        let spaceBetweenCells : CGFloat = 10
        let padding : CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numOfColumns - 1) * spaceBetweenCells) / numOfColumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .Dark{
            UserDataServices.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }else{
            UserDataServices.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell{
            cell.configureSegment(index: indexPath.row, avatarType: avatarType)
            return cell
        }else{
           return AvatarCell()
        }
    }
    
    
}
