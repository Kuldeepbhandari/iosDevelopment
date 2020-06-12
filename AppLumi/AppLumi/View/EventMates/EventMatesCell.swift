//
//  EventMatesCell.swift
//  AppLumi
//
//  Created by mac on 15/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class EventMatesCell: UITableViewCell {

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var reportBtn: UIButton!
    
    @IBOutlet weak var eventAddressLbl: UILabel!
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var innviteBtn: UIButton!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var inviteView: UIView!
    @IBOutlet weak var personImage: UIImageView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        inviteView.layer.cornerRadius = inviteView.frame.width/2
        chatView.layer.cornerRadius = chatView.frame.width/2
        chatView.clipsToBounds = true
        inviteView.clipsToBounds = true
        eventView.layer.cornerRadius = 11.5
        eventView.clipsToBounds = true
        containerView.layer.cornerRadius = 11.5
        addTopRoundedCornerToView(targetView: customView, desiredCurve: 30)
        
    }
    
    func addTopRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?){
        let offset:CGFloat = targetView!.frame.width/desiredCurve!
        let bounds: CGRect = targetView!.bounds

       let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        targetView!.layer.mask = maskLayer
    }
    
    
    
     
    
    @IBAction func userDatingView(_ sender: Any) {
        
        
    }
    
    @IBAction func inviteBtnTapped(_ sender: Any) {
    }
}


extension UIView{
    func roundCorner(_ corner:UIRectCorner,radius:CGFloat){
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath

        self.layer.mask = maskLayer
    }
    
}
