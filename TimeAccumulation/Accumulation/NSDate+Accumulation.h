//
//  NSDate+Accumulation.h
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  日期积累

#import <Foundation/Foundation.h>

@interface NSDate (Accumulation)


#pragma mark -- 获取当前时间字符串：传入字符串格式
+(NSString *)getCurDateString:(NSString *)dateFormat;

#pragma mark -- 时间格式转换：传入初始格式和目标格式
+(NSString *)changeDateFormat:(NSString *)dateStr from:(NSString *)fromFormat to:(NSString *)toFormat;

#pragma mark -- 获取一定数量的天数：天数、开始日期（nil为当天）、之前还是之后
+(NSArray *)getDays:(int)dayCount startDay:(NSString *)startDay before:(BOOL)isBefore;

#pragma mark -- 获取一定数量的月数：月数、开始月份（nil为当天）、之前还是之后
+(NSArray *)getMonths:(int)monthCount startMonth:(NSString *)startMonth before:(BOOL)isBefore;

#pragma mark -- 计算两个日期的间隔日期
+(int)gapWithDays:(NSString *)startDate endDay:(NSString *)endDate;

#pragma mark -- 计算两个月份的间隔
+(int)gapWithMonths:(NSString *)startDate endDay:(NSString *)endDate;


@end
