//
//  ViewTest.swift
//  CoreGraphicTest
//
//  Created by 王富生 on 2017/1/23.
//  Copyright © 2017年 王富生. All rights reserved.
//

import UIKit

@IBDesignable class Rect: UIView {
    override func draw(_ rect: CGRect) {
        
        var startColor: UIColor = .FuYellow
        var endColor: UIColor = .lightBlue
        var colors = [startColor.cgColor, endColor.cgColor]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let colorLocation: [CGFloat] = [0.0, 1.0]

        
        var gradient = CGGradient.init(colorsSpace: colorSpace,
                                       colors: colors as CFArray,
                                       locations: colorLocation)
        
        
        let context = UIGraphicsGetCurrentContext()
        var startPoint = CGPoint.zero
        var endPoint = CGPoint(x: 0, y: bounds.maxY)
        
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: .init(rawValue: 0))
        
        let oval = UIBezierPath(ovalIn: CGRect(x: rect.width / 4, y: rect.height / 4, width: rect.width / 2, height: rect.height / 2))
        
        context?.saveGState()
        oval.addClip()
        
        startColor = .white
        endColor = .black
        colors = [startColor.cgColor, endColor.cgColor]
        
        gradient = CGGradient.init(colorsSpace: colorSpace,
                                   colors: colors as CFArray,
                                   locations: colorLocation)
        startPoint = CGPoint(x: 0, y: rect.height / 4)
        endPoint = CGPoint(x: 0, y: rect.height * 3 / 4)
        
        context?.drawLinearGradient(gradient!,
                                    start: startPoint,
                                    end: endPoint,
                                    options: .init(rawValue: 0))
        
        let oval2 = UIBezierPath(ovalIn: CGRect(x: rect.width / 4 + 20, y: rect.height / 4 + 10, width: rect.width / 2, height: rect.height / 2))
        UIColor.black.setFill()
        
        context?.restoreGState()
        oval2.fill()
        
    }
}

@IBDesignable class Oval: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: rect.width / 2, y: rect.height * 3 / 4 - 100, width: rect.width / 4, height: rect.width / 4))
        UIColor.backgroundGray.setFill()
        path.fill()
        
        let path2 = UIBezierPath(ovalIn: CGRect(x: rect.width / 2 + 50, y: rect.height * 3 / 4 - 100, width: rect.width / 4, height: rect.width / 4))
        UIColor.black.setFill()
        path2.fill()
    }
}


@IBDesignable class ArcCenter: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2, y: bounds.height / 2),
                                radius: bounds.width / 2,
                                startAngle: CGFloat(3 * M_PI / 4),
                                endAngle: CGFloat(M_PI / 4),
                                clockwise: true)
        UIColor.red.setStroke()
        path.stroke()
    }
}

@IBDesignable class RoundedRect: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect,
                                cornerRadius: rect.width / 4)
        UIColor.green.setStroke()
        path.stroke()
    }
}

@IBDesignable class Path: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width / 2, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height - 10))
        path.addLine(to: CGPoint(x: 0, y: bounds.height - 10))
        path.close()
        
        
        path.stroke()
    }
}
