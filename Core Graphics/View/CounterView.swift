//
//  CounterView.swift
//  Core Graphics
//
//  Created by Denis Bystruev on 30/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {

    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth = CGFloat(5)
        static let arcWidth = CGFloat(76)
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
        
    @IBInspectable var counter = 0 {
        didSet {
            if counter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor = #colorLiteral(red: 0.1320397556, green: 0.3402992487, blue: 0.3105520606, alpha: 1)
    @IBInspectable var counterColor = #colorLiteral(red: 0.2883556485, green: 0.6759775281, blue: 0.6505880952, alpha: 1)
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height) / 2
        let startAngle = 3 / 4 * CGFloat.pi
        let endAngle = CGFloat.pi / 4
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - Constants.arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // Draw the outline
        let angleDifference = 2 * CGFloat.pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses)
        let outlineEndAngle = startAngle + arcLengthPerGlass * CGFloat(counter)
        
        let outlinePath = UIBezierPath(arcCenter: center,
                                       radius: radius - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outlineEndAngle,
                                       clockwise: true)
        
        outlinePath.addArc(withCenter: center,
                           radius: radius - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outlineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
    }
}
