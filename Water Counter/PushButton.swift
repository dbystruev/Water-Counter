//
//  PushButton.swift
//  Water Counter
//
//  Created by Denis Bystruev on 12/03/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

@IBDesignable class PushButton: UIButton {
    
    @IBInspectable var fillColor = UIColor.green
    @IBInspectable var isAddButton = true
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.5
    }
    
    private var halfWidth: CGFloat {
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        
        // Drawing horizontal line
        plusPath.move(to: CGPoint(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        plusPath.addLine(to: CGPoint(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift
        ))
        
        if isAddButton {
            // Drawing vertical line
            plusPath.move(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusWidth + Constants.halfPointShift
            ))
            plusPath.addLine(to: CGPoint(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusWidth + Constants.halfPointShift
            ))
        }
        
        
        UIColor.white.setStroke()
        plusPath.stroke()
    }
}
