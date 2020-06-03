//
//  ViewController.swift
//  RingGraphView
//
//  Created by mac on 21/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var ringGraphView: RingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ringGraphView.progress = CGFloat(slider.value)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        ringGraphView.progress = CGFloat(sender.value)
        
    }
    
}

