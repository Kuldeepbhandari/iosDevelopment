//
//  ViewController.swift
//  ChainAnimation
//
//  Created by mac on 20/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var findFoodLbl: UILabel!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var descLbl: UIStackView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var bgImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        findFoodLbl.alpha = 0
        infoBtn.alpha = 0
        descLbl.alpha = 0
        titleLbl.alpha = 0
        bgImg.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, animations: {
            self.bgImg.alpha = 0.6
        }) { (true) in
            self.showTitle()
        }
    }

    func showTitle(){
        UIView.animate(withDuration: 2, animations: {
            self.titleLbl.alpha = 1
        }) { (true) in
            self.showDesc()
        }
    }
    
    func showDesc(){
        UIView.animate(withDuration: 1, animations: {
            self.descLbl.alpha = 1
        }) { (true) in
            self.showInfoBtn()
        }
    }
    
    func showInfoBtn(){
        UIView.animate(withDuration: 1, animations: {
            self.infoBtn.alpha = 1
        }) { (true) in
            self.showfindFood()
        }
    }

    func showfindFood(){
        UIView.animate(withDuration: 1, animations: {
            self.findFoodLbl.alpha = 1
        }, completion: nil)
    }
}

