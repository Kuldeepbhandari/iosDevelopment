//
//  SavedCard.swift
//  AppLumi
//
//  Created by mac on 06/05/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation

struct SavedCard:Codable {
    let status:String
    let count:Int
    let cards:[Card]
}


struct Card : Codable{
    let expiry_date:ExpiryDate
    let cardNumber:String
    let card_name:String
    let cvv:String
    let  gateway : String
    let name : String
    let type:String
    
    enum CodingKeys:String,CodingKey {
        case expiry_date = "expiry_date"
        case cardNumber = "cardNumber"
        case card_name = "card_name"
        case cvv = "cvv"
        case gateway = "gateway"
        case name = "name"
        case type = "type"
        
    }
}



struct ExpiryDate:Codable {
    let month,year:Int
}
