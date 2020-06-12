//
//  CardModel.swift
//  CardGame
//
//  Created by mac on 07/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import Foundation

class CardModel{
    
    func getCards() -> [Card]{
//        Declare an empty array
        
        var genratedCards = [Card]()
      //  var randomNoArr = [Int]()
        var c = [Int]()
//        Random genrated 8 cards of pair
        while  c.count < 8{
            let randomNo = Int.random(in: 1...13)
            
            if !c.contains(randomNo){
//            Create two new card object
                c.append(randomNo)
            let cardOne = Card()
            let cardTwo = Card()
//            Set their image name
            cardOne.imagename = "card \(randomNo)"
            cardTwo.imagename = "card \(randomNo)"
//            add them to an array
            genratedCards += [cardOne,cardTwo]
            print(randomNo)
        }
        }
        return genratedCards.shuffled()
    }
}
