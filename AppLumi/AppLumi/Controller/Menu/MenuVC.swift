//
//  MenuVC.swift
//  AppLumi
//
//  Created by appinventiv on 21/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    
    @IBOutlet weak var eventsView: RoundView!
    @IBOutlet weak var lumiDatesView: RoundView!
    @IBOutlet weak var mayBeMatchesView: RoundView!
    
    @IBOutlet weak var invitesView: RoundView!
    @IBOutlet weak var settingView: RoundView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupIntialView()
    }
    
    @IBAction func backBtnWasTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupIntialView(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openHomeMapView))
        eventsView.isUserInteractionEnabled = true
        eventsView.addGestureRecognizer(tapGesture)
        
        let settingTapGesture = UITapGestureRecognizer(target: self, action: #selector(openSettingView))
        settingView.isUserInteractionEnabled = true
        settingView.addGestureRecognizer(settingTapGesture)
        
      //  EventMatesVC
        
        let eventMateTapGesture = UITapGestureRecognizer(target: self, action: #selector(openEventmateView))
               lumiDatesView.isUserInteractionEnabled = true
               lumiDatesView.addGestureRecognizer(eventMateTapGesture)
        
        let inviteVcGesture = UITapGestureRecognizer(target: self, action: #selector(naivigateToInviteVC))
        invitesView.isUserInteractionEnabled = true
        invitesView.addGestureRecognizer(inviteVcGesture)
        
    }
    
//    MARK:This function is used to navigate the invite vc
    @objc func naivigateToInviteVC(){
        guard let homeMapVC = self.storyboard?.instantiateViewController(withIdentifier: "InviteVC") as? InviteVC else {return}
        self.navigationController?.pushViewController(homeMapVC, animated: true)
    }
    
    @objc func openHomeMapView(){
        guard let homeMapVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeMapView") as? HomeMapView else {return}
               self.navigationController?.pushViewController(homeMapVC, animated: true)
    }
    
    //    MARK:This function is used to navigate the setting vc
    @objc func openSettingView(){
        guard let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingVC") as? SettingVC else {return}
        self.navigationController?.pushViewController(settingVC, animated: true)
    }
//    MARK:This function is used to opne Event Mate view
    @objc func openEventmateView(){
        guard let lumiDates = self.storyboard?.instantiateViewController(withIdentifier: "EventMatesVC") as? EventMatesVC else {return}
        self.navigationController?.pushViewController(lumiDates, animated: true)
    }

}
