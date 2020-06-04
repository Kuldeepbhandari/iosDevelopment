//
//  ViewController.swift
//  RechabilityDemo
//
//  Created by mac on 30/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    
    let network:NetworkManager = NetworkManager.instance
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       NetworkManager.networkIsUnReachable { (_) in
            self.showOfflinePage()
        }
        
        NetworkManager.networkIsReachable { (_) in
            self.showReachablePage()
        }
    }

    func showOfflinePage() -> Void{
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "offlineVC", sender: self)
        }
    }

    func showReachablePage() -> Void{
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "mainVC", sender: self)
        }
    }
}

