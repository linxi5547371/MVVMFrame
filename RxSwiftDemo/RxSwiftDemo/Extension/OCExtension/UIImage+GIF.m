//
//  UIImage+GIf.m
//  RxSwiftDemo
//
//  Created by 方梦凯 on 2019/10/10.
//  Copyright © 2019 方梦凯. All rights reserved.
//

#import "UIImage+GIF.h"
#import <ImageIO/ImageIO.h>
#import "RxSwiftDemo-Swift.h"

@implementation UIImage (GIFImage)

+ (UIImage *)animatedGIFImagesWithData:(NSData *)data {
    if (!data) {
        return nil;
    }
    
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    size_t count = CGImageSourceGetCount(source);
    
    UIImage *staticImage;
    
    if (count <= 1) {
        staticImage = [[UIImage alloc] initWithData:data];
    } else {

        CGFloat scale = 1;
        scale = [UIScreen mainScreen].scale;
        
        NSMutableArray<UIImage *>* array = [[NSMutableArray alloc] initWithCapacity:count];
        for (int i = 0; i < count; i++) {
            CGImageRef CGImage = CGImageSourceCreateImageAtIndex(source, i, NULL);

            UIImage *frameImage = [UIImage imageWithCGImage:CGImage scale:scale orientation:UIImageOrientationUp];
            [array addObject:frameImage];

            CGImageRelease(CGImage);
        }
        
        staticImage = [UIImage animatedImageWithImages:array duration:0.0f];

    }
    
    CFRelease(source);
    
    return staticImage;
}

@end
