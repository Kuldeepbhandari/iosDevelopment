//
//  RingView.swift
//  RingGraphView
//
//  Created by mac on 21/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class RingView: UIView {

    let backDropLayer : CAShapeLayer = CAShapeLayer()
    
    var progress : CGFloat = CGFloat(0.5){
        didSet{
            if progress >= 1.0{
                progress = 1.0
            }else if progress <= 0.0{
                progress = 0.0
            }
            
            ringLayer.strokeEnd = progress
        }
        
    }
    
    let ringLayer : CAShapeLayer = CAShapeLayer()

    let ringWidth : CGFloat = 40.0
    
    var halfRingWidth : CGFloat {
        return ringWidth/2
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let circlePath = UIBezierPath(ovalIn: CGRect(x: halfRingWidth, y: halfRingWidth, width: bounds.width-ringWidth, height: bounds.height-ringWidth)).cgPath
        
        let offset : CGFloat = CGFloat(90 * Double.pi / 180)
        backDropLayer.path = circlePath
        backDropLayer.lineWidth = ringWidth
        backDropLayer.strokeEnd = 1.0
        backDropLayer.fillColor = nil
        backDropLayer.strokeColor = UIColor(red: 112/255, green: 25/255, blue: 18/255, alpha: 1).cgColor
        layer.addSublayer(backDropLayer)
        
        ringLayer.path = circlePath
        ringLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        ringLayer.lineWidth = ringWidth
        ringLayer.strokeColor = UIColor.black.cgColor
        ringLayer.fillColor = nil
        ringLayer.strokeEnd = 0.5
        ringLayer.lineCap = .round
        ringLayer.transform = CATransform3DMakeRotation(offset, 0, 0, -1.0)
       // layer.addSublayer(ringLayer)
        
        let gradineLayer = CAGradientLayer()
        gradineLayer.colors = [UIColor(red: 231/255, green: 31/255, blue: 38/255, alpha: 1).cgColor,UIColor(red: 248/255, green: 255/255, blue: 174/255, alpha: 1.0).cgColor]
        gradineLayer.frame = bounds
        gradineLayer.locations = [0.0,1.0]
        gradineLayer.mask = ringLayer
        layer.addSublayer(gradineLayer)
        
        
    }
}
