//
//  PushButton.swift
//  Core Graphics
//
//  Created by Гость on 23/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

@IBDesignable class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3
        static let plusButtonScale: CGFloat = 0.6
    }
    private var halfWidth: CGFloat {
    return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.black.setFill()
        path.fill()
        
        // Horizontal Line
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        UIColor.white.setStroke()
        
        plusPath.stroke()
        
        // Vertical Line
    }
    
}
