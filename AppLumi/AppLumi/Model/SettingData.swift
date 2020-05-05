//
//  SettingData.swift
//  AppLumi
//
//  Created by mac on 04/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import UIKit

struct SettingData {
    
    let labelName : String?
    let image:UIImage?
    
   static let data = [
        SettingData(labelName: "Recovery Email", image: UIImage(named: "icSettingsAboutUs")),
        SettingData(labelName: "Change Password", image: UIImage(named: "icSettingsChangePassword")),
        SettingData(labelName: "My Event Tickets", image: UIImage(named: "icSettingsEventTickets")),
        SettingData(labelName: "Terms & Conditions", image: UIImage(named: "icSettingsTerms")),
        SettingData(labelName: "FAQ", image: UIImage(named: "icSettingsFaq")),
        SettingData(labelName: "About Us", image: UIImage(named: "icSettingsAboutUs")),
        SettingData(labelName: "Privacy Policy", image: UIImage(named: "icSettingsPrivacyPolicy")),
        SettingData(labelName: "Contact Us", image: UIImage(named: "icSettingsContactUs"))
    ]
    
}


