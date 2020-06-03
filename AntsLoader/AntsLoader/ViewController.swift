//
//  ViewController.swift
//  AntsLoader
//
//  Created by mac on 21/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createAntsLoader()
        
    }

    func createAntsLoader(){
        let antsLoader = CAShapeLayer()
        let lineWidth:CGFloat = 6.0
        antsLoader.lineWidth = lineWidth
        antsLoader.strokeColor = UIColor.purple.cgColor
        antsLoader.path = UIBezierPath(ovalIn: CGRect(x: lineWidth/2, y: lineWidth/2, width: 200-lineWidth, height: 200-lineWidth)).cgPath
        antsLoader.frame = CGRect(x: view.frame.midX-100, y: view.frame.midY-100, width: 200, height: 200)
        
        let radius = (200-lineWidth)/2
        let circumFerance = 2 * CGFloat(Double.pi) * radius
        let phaseSize = circumFerance / 200
        antsLoader.lineDashPattern = [NSNumber(value: Float(phaseSize))]
        antsLoader.fillColor = nil
        view.layer.addSublayer(antsLoader)
    }

}

