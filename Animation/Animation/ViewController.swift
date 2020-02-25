//
//  ViewController.swift
//  Animation
//
//  Created by mac on 12/02/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateBtnOutlet: UIButton!
    @IBOutlet weak var animateView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let newWidht:CGFloat = 60
    
//    func animate(){
//        UIView.animate(withDuration: 1) {
//            self.animateView.backgroundColor = UIColor.green
//           // self.animateView.frame.size.height += 20
//           // self.animateView.frame.size.width += 20
//
//        }
//        UIView.animate(withDuration: 2, delay: 0.25, options: [.curveLinear], animations: {
//            self.animateView.frame = CGRect(x: 0, y: 0, width: self.newWidht, height: self.newWidht)
//            self.animateView.center = self.view.center
//        }, completion: nil)
//    }
    
    func basicAniation(){
        UIView.animate(withDuration: 2) {
           // self.animateBtnOutlet.frame = CGRect(x: 0, y: 0, width: self.newWidht, height: self.newWidht)
            self.animateBtnOutlet.bounds = CGRect(x: 0, y: 0, width: self.newWidht, height: self.newWidht)
            self.animateBtnOutlet.center = self.view.center
            
        }
        
    }
        //MARK:This function is used to dampping efeect in the animation
        
        func dampingEffect(){
            let newButtonWidth: CGFloat = 60
            UIView.animate(withDuration: 1.0, //1
                delay: 0.0, //2
                usingSpringWithDamping: 0.5, //3
                initialSpringVelocity: 1, //4
                options: UIView.AnimationOptions.curveEaseInOut, //5
                animations: ({ //6
                    self.animateBtnOutlet.frame = CGRect(x: 0, y: 0, width: newButtonWidth, height: newButtonWidth)
                    self.animateBtnOutlet.center = self.view.center
                }), completion: nil)
        }
        
    

    @IBAction func tapOnAnimate(_ sender: Any) {
      //  animate()
       // basicAniation()
        dampingEffect()
    }
    
}


