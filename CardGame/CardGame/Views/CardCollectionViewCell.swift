//
//  CardCollectionViewCell.swift
//  CardGame
//
//  Created by mac on 08/06/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var cardImage: UIImageView!
    
    var card:Card?
    
    func configureCell(card:Card){
        //        Keep track of the card of this cell reprsents
        self.card = card
        //        Set the front image
        cardImage.image = UIImage(named: card.imagename)
//        Reset the state of cell by checking flipped status of the card and then showing
        if card.isFlipped == true{
//            show the front image view
            flipUp(speed: 0)
        }else{
//            show the back image view
            
        }
    }
    
    func flipUp(speed:TimeInterval){
//       UiView flip Up animation
        UIView.transition(from: backImage, to: cardImage, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
    }
    
    func flipDown(speed:TimeInterval){
//        Uiview flip down animation
        UIView.transition(from: cardImage, to: backImage, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
    }
}
