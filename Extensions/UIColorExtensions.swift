//
//  UIColorExtensions.swift
//  DiamondClient
//
//  Created by mac on 15/12/1.
//  Copyright © 2015年 hiersun. All rights reserved.
//

import Foundation
import UIKit

private struct Color {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
};

/**
 根据rgb值快速构造UIColor对象
 */
public func RGB(r r: CGFloat,g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    
    return UIColor(red: r/255, green: g/255, blue: b/255, alpha: alpha/100)
}


extension UIColor {
    /**
     * 16进制初始化UIColor.0xff5577
     */
    public convenience init(rgb: Int) {
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: 1)
    }
    
    public convenience init(rgb: Int, alpha: Int) {
        self.init(
            red:   CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((rgb & 0x0000FF) >> 0)  / 255.0,
            alpha: CGFloat(alpha / 100))
    }

    public convenience init(colorString: String) {
        var colorInt: UInt32 = 0
        NSScanner(string: colorString).scanHexInt(&colorInt)
        self.init(rgb: (Int) (colorInt ?? 0xaaaaaa))
    }

}
