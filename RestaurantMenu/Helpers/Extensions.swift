//
//  Extensions.swift
//  RestaurantMenu
//
//  Created by Fatma Mohamed on 6/7/18.
//  Copyright © 2018 Fatma Mohamed. All rights reserved.
//

import Foundation
import UIKit



@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
