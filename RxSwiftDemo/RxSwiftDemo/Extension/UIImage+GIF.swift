//
//  UIImage+GIF.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func animatedGIFImages(data: Data) -> UIImage? {
        if let source = CGImageSourceCreateWithData(data as CFData, nil) {
            let count = CGImageSourceGetCount(source)
            var staticImage: UIImage? = nil
            
            if (count <= 1) {
                staticImage = UIImage(data: data)
            } else {
                let scale = UIScreen.main.scale
                var array: [UIImage] = []
                
                for i in 1...count {
                    if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                       let frameImage = UIImage(cgImage: cgImage, scale: scale, orientation: .up)
                        array.append(frameImage)
                    } else {
                        continue
                    }
                }
                staticImage = UIImage.animatedImage(with: array, duration: 0)
            }
            return staticImage
        } else {
            return nil
        }
        
    }
}

extension UIImage {
    class func cutCurrentViewToImage(view: UIView) -> UIImage? {
        var image: UIImage? = nil
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    class func cutCurrentViewWithRender(view: UIView) -> UIImage? {
        let render = UIGraphicsImageRenderer(bounds: view.bounds)
        return render.image(actions: { (context) in
            return view.layer.render(in: context.cgContext)
        })
        
    }
}
