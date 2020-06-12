//
//  BinaryDecimal.swift
//  CovertBinaryNo
//
//  Created by mac on 06/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation

class BinaryDecimal{
    
    var bits : [Int]?
    var integer:Int?
    
    init(_ bits:[Int]?) {
        self.bits = bits
    }
    
    init(_ decimal:Int?) {
        self.integer = decimal
    }
    
    func calculateBinaryValueForInt() -> String{
        var newInt = integer!
        let rows = [128,64,32,16,8,4,2,1]
        var binaryRows : [Int] = []
        for row in rows{
            let binaryDigit = oneOrZero(forValue: newInt, withBitValue: row)
            binaryRows.append(binaryDigit)
            if binaryDigit == 1{
                newInt = newInt - row
            }
        }
        let strignFromIntArr = binaryRows.map{String($0)}
        return strignFromIntArr.joined()
    }
    
    func oneOrZero(forValue value:Int,withBitValue bitValue:Int) -> Int{
        if value-bitValue >= 0{
            return 1
        }else{
            return 0
        }
    }
    
}
