//
//  ViewController.swift
//  CaShapeLayerDemo
//
//  Created by mac on 21/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let squareShapeLayer = CAShapeLayer()
    
    let traingleShapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createsquareShapeLayer()
        createTraingleShape()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        squareShapeLayer.path = UIBezierPath(rect: CGRect(x: 50, y: 150, width: 200, height: 200)).cgPath
        
        let trainglePath = UIBezierPath()
        trainglePath.move(to: CGPoint(x: 150, y: 400))
        trainglePath.addLine(to: CGPoint(x: 300, y: 400))
        trainglePath.addLine(to: CGPoint(x: 225, y: 200))
        trainglePath.close()
        traingleShapeLayer.path = trainglePath.cgPath
        
    }
    
    func createsquareShapeLayer(){
        
        squareShapeLayer.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(squareShapeLayer)
        
    }
    
    func createTraingleShape(){
        traingleShapeLayer.fillColor = UIColor.green.cgColor
        view.layer.addSublayer(traingleShapeLayer)
    }
    

}

