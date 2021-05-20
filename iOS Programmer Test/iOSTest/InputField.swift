//
//  InputField.swift
//  iOSTest
//
//  Created by Tan Tan on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class InputField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
