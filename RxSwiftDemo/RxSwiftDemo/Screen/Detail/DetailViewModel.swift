//
//  DetailViewModel.swift
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

struct DetailViewModel {
    
    var imageGIF = BehaviorRelay<UIImage>(value: UIImage())
    
    init() {
        let path = Bundle.main.path(forResource: "testGIF", ofType: ".gif")
        if let data = FileManager.default.contents(atPath: path!) {
            if let image = UIImage.animatedGIFImages(data: data) {
                if image.isGIF() { // image.images != nil
                    imageGIF.accept(image)
                }
            }
        }
    }
}
