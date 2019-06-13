//
//  UIImageView.swift
//  MVVMFrame
//
//  Created by fangmengkai on 2019/6/12.
//  Copyright © 2019 linxi. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

let kfImageCacheName = "NetworkImage"

extension UIImageView {
    
    func setInternetImage(urlStr: String) {
        
        ImageCache(name: kfImageCacheName).retrieveImage(forKey: urlStr, options: []) { (image, cacheType) in
            if image != nil {
                self.image = image!
            } else {
                self.kfGetInternetImage(urlStr: urlStr)
            }
        }
    }
    
    func kfGetInternetImage(urlStr: String) {

        self.kf.indicatorType = .activity
        self.kf.setImage(with: URL(string: urlStr), placeholder: nil, options: [], progressBlock: nil) { [weak self] (image, error, cacheType, url) in
            
            if image != nil {
                ImageCache(name: kfImageCacheName).store(image!, forKey: urlStr)
                self?.image = image
            }
        }
    }
    
}
