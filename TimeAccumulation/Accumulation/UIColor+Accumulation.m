//
//  UIColor+Accumulation.m
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  颜色积累

#import "UIColor+Accumulation.h"

@implementation UIColor (Accumulation)

#pragma mark -- 主题色
+(UIColor *)THEME_COLOR{
    return [self RGB:@"#02b9f5"];
}

#pragma mark -- 蓝色
+(UIColor *)COLOR_69abff{
    return [self RGB:@"#69abff"];
}
+(UIColor *)COLOR_00c8ea{
    return [self RGB:@"#00c8ea"];
}


#pragma mark -- 灰色
+(UIColor *)COLOR_dddddd{
    return [self RGB:@"#dddddd"];
}
+(UIColor *)COLOR_eeeeee{
    return [self RGB:@"#eeeeee"];
}

#pragma mark -- 黑色
+(UIColor *)COLOR_3f3f3f{
    return [self RGB:@"#3f3f3f"];
}
+(UIColor *)COLOR_767676{
    return [self RGB:@"#767676"];
}

#pragma mark -- 绿色
+(UIColor *)COLOR_1cc487{
    return [self RGB:@"#1cc487"];
}


+(UIColor *)RGB:(NSString *)_STR_{
    return [UIColor colorWithRed:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(1, 2)] UTF8String], 0, 16)] intValue] / 255.0 green:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(3, 2)] UTF8String], 0, 16)] intValue] / 255.0 blue:[[NSString stringWithFormat:@"%lu", strtoul([[_STR_ substringWithRange:NSMakeRange(5, 2)] UTF8String], 0, 16)] intValue] / 255.0 alpha:1.0];
}

@end
