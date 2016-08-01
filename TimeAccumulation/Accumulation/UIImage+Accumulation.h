//
//  UIImage+Accumulation.h
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  图片积累

#import <UIKit/UIKit.h>

@interface UIImage (Accumulation)

// 转变图片到指定大小
+(UIImage*) OriginImage:(NSString *)imageName scaleToSize:(CGSize)size;

// 将base字符串转UIImage
+(UIImage *)stringToImage:(NSString *)imageStr;


@end
