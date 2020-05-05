//
//  GetQuestions.swift
//  AppLumi
//
//  Created by appinventiv on 10/04/20.
//  Copyright © 2020 appinventiv. All rights reserved.
//

import Foundation


struct GetQuestions:Decodable {
    let question : String
    let answer : String
    let Q_id:Int
}
