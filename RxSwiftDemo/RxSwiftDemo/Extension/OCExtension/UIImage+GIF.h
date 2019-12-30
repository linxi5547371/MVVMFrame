//
//  UIImage+GIF.h
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger, UIImageType) {
    UIImageTypeNormal = 1,
    UIImageTypeGIF = 2,
};

@interface UIImage (GIFImage)

+ (UIImage *)animatedGIFImagesWithData:(NSData *)data;

@end
