//
//  CountryData.swift
//  AppLumi
//
//  Created by appinventiv on 21/03/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation

enum Country:String,CaseIterable{
    case CountryName
    case CountryCode
    case Flag
}

enum CountryName:String,CaseIterable {
    case India = "India"
    case Afghanistan = "Afghanistan"
    case Australia = "Australia"
    case Bhutan = "Bhutan"
    case Brazil = "Brazil"
    case Canada = "Canada"
    case China = "China"
    case France = "France"
    case Japan = "Japan"
    case Pakistan = "Pakistan"
}

enum CountryCode:String{
    case India       = "91"
    case Afghanistan = "93"
    case Australia   = "0061"
    case Bhutan      = "975"
    case Brazil      = "55"
    case Canada      = "1"
    case China       = "86"
    case France      = "33"
    case Japan       = "81"
    case Pakistan    = "92"
}


enum Flag:String{
    case India = "flag-of-India"
    case Afghanistan = "flag-of-Afghanistan"
    case Australia = "flag-of-Australia"
    case Bhutan = "flag-of-Bhutan"
    case Brazil = "flag-of-Brazil"
    case Canada = "flag-of-Canada"
    case China  = "flag-of-China"
    case France = "flag-of-France"
    case Japan  = "flag-of-Japan"
    case Pakistan = "flag-of-Pakistan"
}

struct  CountryData {

    let countryName:CountryName
    let countryCode:CountryCode
    let flag:Flag
}


extension String{
    
    var localized:String{
        return NSLocalizedString(self, comment: "")
    }
}
