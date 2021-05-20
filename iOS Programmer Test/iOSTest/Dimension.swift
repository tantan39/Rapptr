//
//  Dimension.swift
//  iOSTest
//
//  Created by Tan Tan on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

struct Dimension {
    public static let shared = Dimension()
    
    public var buttonHeight: CGFloat {
        return 55 //* self.heightScale
    }
    
    // MARK: Spacing
    public var smallHorizontalMargin: CGFloat {
        return 4
    }
    
    public var smallVerticalMargin: CGFloat {
        return 4
    }
    
    public var mediumHorizontalMargin: CGFloat {
        return 8
    }
    
    public var mediumVerticalMargin: CGFloat {
        return 8
    }
    
    public var mediumHorizontalMargin_12: CGFloat {
        return 12
    }
    
    public var mediumVerticalMargin_12: CGFloat {
        return 12
    }
    
    public var normalHorizontalMargin: CGFloat {
        return 16
    }
    
    public var normalVerticalMargin: CGFloat {
        return 16
    }
    
    public var largeHorizontalMargin: CGFloat {
        return 24
    }
    
    public var largeVerticalMargin: CGFloat {
        return 24
    }
    
    public var largeHorizontalMargin_30: CGFloat {
        return 30
    }
    
    public var largeVerticalMargin_30: CGFloat {
        return 30
    }
    
    public var largeHorizontalMargin_32: CGFloat {
        return 32
    }
    
    public var largeVerticalMargin_32: CGFloat {
        return 32
    }
    
    public var largeVerticalMargin_38: CGFloat {
        return 38
    }
    
    public var largeHorizontalMargin_40: CGFloat {
        return 40
    }
    
    public var largeHorizontalMargin_42: CGFloat {
        return 40
    }
    
    public var largeVerticalMargin_40: CGFloat {
        return 40
    }
}
