//
//  UIImage+GIF.h
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GIFImage)

+ (UIImage *)animatedGIFImagesWithData:(NSData *)data;

@end
