//
//  CGRect+Ext.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 18/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import CoreGraphics

extension CGRect {

    static var iPhone5: CGRect {
        return CGRect(x: 0, y: 0, width: 320, height: 568)
    }

    static var iPhone5Landscape: CGRect {
        return CGRect(x: 0, y: 0, width: 568, height: 320)
    }

    static var iPhone8: CGRect {
        return CGRect(x: 0, y: 0, width: 375, height: 667)
    }

    static var iPhone8Plus: CGRect {
        return CGRect(x: 0, y: 0, width: 414, height: 736)
    }

    static var iPhoneX: CGRect {
        return CGRect(x: 0, y: 0, width: 375, height: 812)
    }

    static var iPhoneXSMax: CGRect {
        return CGRect(x: 0, y: 0, width: 414, height: 896)
    }

    var minusStatusBar: CGRect {
        return CGRect(x: 0, y: 0, width: self.width, height: self.height - 8.0)
    }

    var minusNavBar: CGRect {
        return CGRect(x: 0, y: 0, width: self.width, height: self.height - 44.0)
    }

}
