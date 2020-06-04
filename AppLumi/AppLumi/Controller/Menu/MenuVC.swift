//
//  MenuVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var eventVIew: UIView!
    
    @IBOutlet weak var invitesView: UIView!
    @IBOutlet weak var settingView: UIView!
    @IBOutlet weak var lumiDateView: UIView!
    @IBOutlet weak var mayBeMatchView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupIntialView()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnWasTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupIntialView(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openHomeMapView))
        eventVIew.isUserInteractionEnabled = true
        eventVIew.addGestureRecognizer(tapGesture)
        
        let settingTapGesture = UITapGestureRecognizer(target: self, action: #selector(openSettingView))
        settingView.isUserInteractionEnabled = true
        settingView.addGestureRecognizer(settingTapGesture)
        
      //  EventMatesVC
        
        let eventMateTapGesture = UITapGestureRecognizer(target: self, action: #selector(openEventmateView))
               lumiDateView.isUserInteractionEnabled = true
               lumiDateView.addGestureRecognizer(eventMateTapGesture)
        
    }
    
    @objc func openHomeMapView(){
        guard let homeMapVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeMapView") as? HomeMapView else {return}
        self.navigationController?.pushViewController(homeMapVC, animated: true)
    }
    

    @objc func openSettingView(){
        guard let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as? SettingVC else {return}
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
    
    @objc func openEventmateView(){
        guard let lumiDates = self.storyboard?.instantiateViewController(withIdentifier: "EventMatesVC") as? EventMatesVC else {return}
        self.navigationController?.pushViewController(lumiDates, animated: true)
    }

}
