//
//  Buttons.swift
//  Core Graphics
//
//  Created by Denis Bystruev on 30/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class PlusButton: PushButton {
    override func draw(_ rect: CGRect) {
        isAddButton = true
        fillColor = #colorLiteral(red: 0.3628821969, green: 0.839086771, blue: 0.8312861323, alpha: 1)
        super.draw(rect)
    }
}

class MinusButton: PushButton {
    override func draw(_ rect: CGRect) {
        isAddButton = false
        fillColor = #colorLiteral(red: 0.9312041402, green: 0.2913395464, blue: 0.2771224678, alpha: 1)
        super.draw(rect)
    }
}
