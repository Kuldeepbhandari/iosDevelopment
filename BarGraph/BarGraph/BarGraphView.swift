//
//  BarGraphView.swift
//  BarGraph
//
//  Created by mac on 20/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
@IBDesignable
class BarGraphView: UIView {

    
    struct BarGraphData {
        var label:String
        var value:Int
        
    }
    
    let barGraphData = [ BarGraphData(label: "Mon", value: 10),
                         BarGraphData(label: "Tue", value: 7),
                         BarGraphData(label: "Wed", value: 12),
                         BarGraphData(label: "Thu", value: 15),
                         BarGraphData(label: "Fri", value: 5),
    ]
    
    let barWidth : CGFloat = 20.0
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let margin : CGFloat = 0.1 * bounds.width
        let graphMidPoint : Int = Int((bounds.height - (2 * margin))/2)
        let linePath = UIBezierPath()
        
        linePath.move(to: CGPoint(x: 0, y: margin))
        linePath.addLine(to: CGPoint(x: bounds.width, y: margin))
        
        linePath.move(to: CGPoint(x: 0, y: CGFloat(graphMidPoint)+margin))
        linePath.addLine(to: CGPoint(x: bounds.width, y: CGFloat(graphMidPoint)+margin))
        
        linePath.move(to: CGPoint(x: 0, y: bounds.height-margin))
        linePath.addLine(to: CGPoint(x: bounds.width, y: bounds.height-margin))
        linePath.stroke()
        
//        MARK:this lines is used to show the value below the lines
        
        let font = UIFont(name: "Avenir-Medium", size: 16)!
        let labelAttriubute = [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:UIColor.black]
        //to get the heighest value from the array
        
        let heightValue = (barGraphData.max {$0.value < $1.value})!.value
        
        let verticalTopLabel = String(heightValue) as NSString
        verticalTopLabel.draw(at: CGPoint(x: 0, y: margin), withAttributes: labelAttriubute)
        
        let midValue = heightValue/2
        let midTopLabel = String(midValue) as NSString
        
        midTopLabel.draw(at: CGPoint(x: 0, y: CGFloat(graphMidPoint)+margin), withAttributes: labelAttriubute)
        
        let lowerLabel = String(0) as NSString
        lowerLabel.draw(at: CGPoint(x: 0, y: bounds.height-margin), withAttributes: labelAttriubute)
        
        let numberOfBars : Int = barGraphData.count
        
        let numberOfGaps : Int = numberOfBars - 1
        
        let barGap : CGFloat = (bounds.width - barWidth * CGFloat(numberOfBars) - (2*margin)) / CGFloat(numberOfGaps)
        
        for i in 0...barGraphData.count - 1{
            let xPos = CGFloat(i) * (barWidth+barGap) + margin
            
            let barHeight : CGFloat = CGFloat(barGraphData[i].value)/CGFloat(heightValue) * (bounds.height-margin*2)
            
            let yPos = bounds.height - barHeight - margin
            
            let bar = UIBezierPath(rect: CGRect(x: xPos, y: yPos, width: barWidth, height: barHeight))
            
            let barColor = UIColor(red: setRandomColor(), green: setRandomColor(), blue: setRandomColor(), alpha: 1)
            
            barColor.setFill()
            bar.fill()
            
            let label = barGraphData[i].label as NSString
            let textPos = CGPoint(x: xPos, y: bounds.height-margin)
            
            label.draw(at: textPos, withAttributes: labelAttriubute)
        }
        
    }
    
    
    func setRandomColor() -> CGFloat{
        return CGFloat(arc4random()) / (CGFloat(UInt32.max))
    }

}
