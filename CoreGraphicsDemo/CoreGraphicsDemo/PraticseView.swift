//
//  PraticseView.swift
//  CoreGraphicsDemo
//
//  Created by mac on 16/05/20.
//  Copyright © 2020 KuldeepBhandari. All rights reserved.
//

import UIKit
@IBDesignable
class PraticseView: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        
//        let ctx = UIGraphicsGetCurrentContext()!
////        This is used to fill color and stroke
//
//        ctx.setFillColor(UIColor.orange.cgColor)
//
////        ctx.setStrokeColor(UIColor.blue.cgColor)
////        MARK:If we set the line width in decimal point then we can move x and y postion increase half pixel also to look our design good
//        ctx.setLineWidth(6.5)
        
//        MARK:We can draw a rectangle also another way
//        THis lines is used to start of the line
//
//        ctx.move(to: CGPoint(x: 0, y: 0))
//        ctx.addLine(to: CGPoint(x: 120, y: 0))
//        ctx.addLine(to: CGPoint(x: 120, y: self.frame.size.height/4))
//        ctx.addLine(to: CGPoint(x: 0, y: self.frame.size.height/4))
////        ctx.addLine(to: CGPoint(x: 0, y: self.frame.height/4))
//        //ctx.closePath()
//
//       // ctx.addLine(to: CGPoint(x: self.frame.size.height/4, y: 30))
//        ctx.closePath()
//        ctx.fillPath()
        
//        MARK:Second way
//        let rectPath = CGMutablePath()
//        rectPath.move(to: CGPoint(x: 4.25, y: 4.25))
//        rectPath.addLine(to: CGPoint(x: 120.25, y: 4.25))
//        rectPath.addLine(to: CGPoint(x: 120.25, y: self.frame.size.height/4.25))
//        rectPath.addLine(to: CGPoint(x: 4.25, y: self.frame.size.height/4.25))
//        rectPath.closeSubpath()
//
//        ctx.addPath(rectPath)
////        MARK:fill path is used to fill the entire color also
//      //  ctx.fillPath()
//        ctx.strokePath()
        
//        MARK:Third way the beizer path
//        let rectPath = UIBezierPath()
//        rectPath.move(to: CGPoint(x: 0, y: 0))
//                rectPath.addLine(to: CGPoint(x: 120, y: 0))
//                rectPath.addLine(to: CGPoint(x: 120, y: self.frame.size.height/4))
//                rectPath.addLine(to: CGPoint(x: 0, y: self.frame.size.height/4))
//        rectPath.fill()
        
//        MARK:The UiBezier path have its own method to draw some shapes
//        let rectPath = UIBezierPath(rect: CGRect(x: 5, y: 5, width: 180, height: 100))
//        rectPath.fill()

//        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 200, height: 100))
//        UIColor.green.setFill()
//////        let cgPath = UIBezierPath(roundedRect: CGRect(x: 20, y: 20, width: 200, height: 100), byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 20, height: 20))
////
//        ovalPath.fill()
//        cgPath.fill()
//        
//        let trainglePath = UIBezierPath()
//        trainglePath.move(to: CGPoint(x: 10, y: 90))
//        trainglePath.addLine(to: CGPoint(x: 100, y: 90))
//        trainglePath.addLine(to: CGPoint(x: 50, y: 10))
//        
//        trainglePath.close()
//        UIColor.blue.setFill()
//        trainglePath.fill()
      //  createTraingle()
       // useOfArc()
       // applyGradient()
        //applyShadow()
        viewTransformation()
    }
    

    
    func createTraingle(){
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 0, y: self.frame.size.height/4))
        trianglePath.addLine(to: CGPoint(x: self.frame.width/5, y: 0))
        trianglePath.addLine(to: CGPoint(x: self.frame.width/5, y: 10))
        
//        trianglePath.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height/4))
        
        
                UIColor.green.setFill()

        trianglePath.fill()
        
    }
    
//    func useOfArc(){
//        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
//        let startAngleInDegree : CGFloat = 135 * CGFloat(Double.pi)/180
//
//        let endAngleInDegree : CGFloat = 45 * CGFloat(Double.pi)/180
//
//        let arcRadius = bounds.width/2
//
//        let arcPath = UIBezierPath(arcCenter: center, radius: arcRadius-15, startAngle: startAngleInDegree, endAngle: endAngleInDegree, clockwise: true)
//        arcPath.lineWidth = 30
//        UIColor.orange.setStroke()
//        arcPath.stroke()
//    }
    
    func applyGradient(){
        
        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: bounds.origin.x, y: bounds.origin.y, width: 200, height: 200))
      //  UIColor.green.setFill()
        ovalPath.addClip()
        let gradientStartColor = UIColor.yellow.cgColor
        let gradientEndColor = UIColor.red.cgColor
        let colors = [gradientStartColor,gradientEndColor]
        let colorLocations : [CGFloat] = [0.0 , 1.0]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)!
        let startPont = CGPoint.zero
        let endPoint = CGPoint(x: 0.0, y: self.bounds.height)
        context.drawLinearGradient(gradient, start: startPont, end: endPoint, options: [])
        context.restoreGState()
        
    }
    
    func applyShadow(){
        
        let context = UIGraphicsGetCurrentContext()!
        let shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        let shadowOffset = CGSize(width: 2.0, height: 2.0)
        let shadowBlurRadius : CGFloat = 5.0

        context.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor)
//        let roundRect = UIBezierPath(rect: CGRect(x: 50, y: 50, width: 200, height: 200))
//        UIColor.green.setFill()
//        roundRect.fill()
        let oval = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 100))
        UIColor.green.setFill()
        oval.fill()
    }
    
    
    func viewTransformation(){
        let context = UIGraphicsGetCurrentContext()!
        let rotaionAngle : CGFloat = 45 * .pi / 180
        let squareWidth : CGFloat = 80
        let viewWidth : CGFloat = bounds.width
        let viewHeight : CGFloat = bounds.height
        
//        context.translateBy(x: viewWidth/2, y: viewHeight/2)
//        context.rotate(by: rotaionAngle)
//        context.scaleBy(x: 1.2, y: 1.2)
        
//        Using CgaffineTranform
        var transform = CGAffineTransform(translationX: viewWidth/2, y: viewHeight/2)
        transform = transform.rotated(by: rotaionAngle)
        transform.scaledBy(x: 1.2, y: 1.2)
        
        let squarePath = UIBezierPath(rect: CGRect(x: -squareWidth/2, y: -squareWidth/2, width: squareWidth, height: squareWidth))
        
    //    squarePath.apply(transform)
        
        context.concatenate(transform)
        UIColor.green.setFill()
        squarePath.fill()
    }
}
