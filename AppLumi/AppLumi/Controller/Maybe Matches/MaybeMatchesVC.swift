//
//  MaybeMatchesVC.swift
//  AppLumi
//
//  Created by mac on 08/06/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class MaybeMatchesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func addTopRoundedCornerToView(targetView:UIView, desiredCurve:CGFloat){
              let offset:CGFloat = targetView.frame.width/desiredCurve
              let bounds: CGRect = targetView.bounds

             let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
              let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
              
              let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
              let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
              rectPath.append(ovalPath)
              // Create the shape layer and set its path
              let maskLayer: CAShapeLayer = CAShapeLayer()
              maskLayer.frame = bounds
              maskLayer.path = rectPath.cgPath

              targetView.layer.mask = maskLayer
              
              
              
          }
}


//MARK:Collection View Delegate and datasource method

extension MaybeMatchesVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaybeMatchCollectionVCCell", for: indexPath) as? MaybeMatchCollectionVCCell else {return UICollectionViewCell()}
        addTopRoundedCornerToView(targetView: cell.bottomView, desiredCurve: 30)
        return cell
    }
    
    
}
