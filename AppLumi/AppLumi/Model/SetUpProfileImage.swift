//
//  SetUpProfileImage.swift
//  AppLumi
//
//  Created by appinventiv on 30/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation
import UIKit

class SetUpProfileImage{
    static let insatance = SetUpProfileImage()

    func selectImage(setImage:UIImageView,setUpImage:SetUpImage){
        if  setUpImage == .Age{
            setImage.image = UIImage(named: "icProfileSetupAgeActive")
        }
    }
}


enum SetUpImage{
    case Age
    case Bio
    case Drugs
    case Political
    case Gender
    case Alcohol
    case Education
    case AnswerBio
    case Hometown
    case Relegion
    case Cigaretee
    case Marijuna
    case Height
    case JobTitle
    case Location
    case ProfileSetup
}

