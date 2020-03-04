//
//  CategoryCell.swift
//  EcommerceHomePage
//
//  Created by mac on 02/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
   
    

    
    @IBOutlet weak var collectioView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectioView.delegate = self
      //  collectionView.dataSource = self
        collectioView.dataSource = self
        // Initialization code
    }

   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 50
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return cell
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return 1
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
