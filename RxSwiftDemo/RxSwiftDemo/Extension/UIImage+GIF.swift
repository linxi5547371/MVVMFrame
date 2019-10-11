//
//  UIImage+GIF.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

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
