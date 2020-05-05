//
//  ViewController+Extension.swift
//  TravelApp
//
//  Created by mac on 08/03/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController{
    
    func changeRoot(){
        let vc = storyboard?.instantiateViewController(identifier: "TabBarVC") as! TabBarVC
        let appdelegate = UIApplication.shared.delegate as? SceneDelegate
        
        appdelegate?.window?.rootViewController = vc
        appdelegate?.window?.makeKeyAndVisible()
    }
}
