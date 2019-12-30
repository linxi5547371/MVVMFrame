//
//  UIView+Extension.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/12/30.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import Foundation

extension UIView {
    func setRadius(radius: CGFloat, corner: UIRectCorner) {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = CACornerMask(rawValue: corner.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
