//
//  ViewController.swift
//  AnimatedGradinetDemo
//
//  Created by mac on 24/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpInitialView()
    }

    func setUpInitialView(){
        let newColors = [UIColor.purple, UIColor.orange,UIColor.systemPink].map { $0.cgColor }
        let newLocations = [0,0]
        let newStartPoint = CGPoint(x: 0, y: 0)
        let newEndPoint = CGPoint(x: view.bounds.width, y: view.bounds.height)
        let gradinetLayer = CAGradientLayer()
//        gradinetLayer.colors = [UIColor.red.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor]
//        gradinetLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradinetLayer.endPoint = CGPoint(x: 1, y: 1)
        gradinetLayer.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: view.bounds.width, height: view.frame.height))
        
        let locationAnimation = CABasicAnimation(keyPath:#keyPath(CAGradientLayer.locations))
        locationAnimation.fromValue = gradinetLayer.locations
        locationAnimation.toValue = newLocations
        
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.colors))
        colorAnimation.fromValue = gradinetLayer.colors
        colorAnimation.toValue = newColors
        
        let startPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnimation.fromValue = gradinetLayer.startPoint
        startPointAnimation.toValue = newStartPoint
        
        let endPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnimation.fromValue = gradinetLayer.endPoint
        endPointAnimation.toValue = newEndPoint
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [colorAnimation,startPointAnimation,endPointAnimation,locationAnimation]
        
        animationGroup.duration = 5.0
        animationGroup.delegate = self
        animationGroup.fillMode = .forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.timingFunction = CAMediaTimingFunction(name: .linear)
        gradinetLayer.colors = newColors
        gradinetLayer.locations = [0,0]
        gradinetLayer.startPoint = newStartPoint
        gradinetLayer.endPoint = newEndPoint
        
        gradinetLayer.add(animationGroup, forKey: "animation-Group")
        
        
        
        view.layer.addSublayer(gradinetLayer)
    }
    
    

}


extension ViewController:CAAnimationDelegate{
    /*
    MARK:This function is used  if we wish to repeat the animation or run another animation after the first has finished we can do so here. Note that we should only do this if the value of flag is true
    */
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag{
           
        }
    }
}
