//
//  Font.swift
//  iOSTest
//
//  Created by Tan Tan on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

extension UIColor {
    static var black: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    static var message: UIColor {
        return UIColor(hex: "#1B1E1F")
    }
    
    static var placeHolder: UIColor {
        return UIColor(hex: "#5F6063")
    }
    
    static var headerBackground: UIColor {
        return UIColor(hex: "#0E5C89")
    }
    
    static var viewBackground: UIColor {
        return UIColor(hex: "#F9F9F9")
    }
}

// MARK: - Support Method
extension UIColor {
    convenience init(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.0)
            return
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: 1.0)
    }
}
