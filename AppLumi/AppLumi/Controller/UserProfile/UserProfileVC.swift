//
//  UserProfileVC.swift
//  AppLumi
//
//  Created by mac on 02/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class UserProfileVC: UIViewController {
    @IBOutlet weak var moderateLbl: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var marijuanaLbl: UIImageView!
    @IBOutlet weak var smokingLbl: UILabel!
    @IBOutlet weak var libertarianLbl: UILabel!
    @IBOutlet weak var drugsLbl: UILabel!
    @IBOutlet weak var userHomeLbl: UILabel!
    @IBOutlet weak var alcoholLbl: UILabel!
    @IBOutlet weak var religionLbl: UILabel!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var educationLbl: UILabel!
    @IBOutlet weak var dobLbl: UILabel!
    @IBOutlet weak var userHeightLbl: UILabel!
    @IBOutlet weak var userAgeLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userLocationLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

   
}


extension UserProfileVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserProfileCell", for: indexPath) as? UserProfileCell else {return UICollectionViewCell()}
        cell.answerLbl.text = "Once you’ve watched each video there’s a short test to help make sure you’ve understood what was taught"
        cell.questionLbl.text = "Once you’ve watched each video there’s a short test to help make sure you’ve understood what was taught"
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 290, height: 120)
//    }
}
