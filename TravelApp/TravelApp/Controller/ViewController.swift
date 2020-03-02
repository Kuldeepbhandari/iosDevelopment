//
//  ViewController.swift
//  TravelApp
//
//  Created by mac on 27/02/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var travelImage: UIImageView!
    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnSignIn.designButton()
        travelImage.layer.cornerRadius = travelImage.frame.width/2
        travelImage.clipsToBounds = true
    }


    @IBAction func tappedOnSignUp(_ sender: UIButton) {
    }
    
    @IBAction func onTappedSignIn(_ sender: UIButton) {
    }
    
}

