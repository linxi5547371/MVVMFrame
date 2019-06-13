//
//  UIColor.swift
//  
//
//  Created by fangmengkai on 2019/6/12.
//

import Foundation
import UIKit

extension UIColor {
    class func fromHex(hexStr: String, alpha: CGFloat) -> UIColor {
        
        let hex = hexStr.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hex)
        var color: UInt32 = 0
        if scanner.scanHexInt32(&color) {
            let r = CGFloat((color & 0xff0000) >> 16) / 255.0
            let g = CGFloat((color & 0x00ff00) >> 8) / 255.0
            let b = CGFloat(color & 0x0000ff) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        } else {
            print("invalid hex string \(hexStr)")
            return UIColor.white
        }
    }
}
