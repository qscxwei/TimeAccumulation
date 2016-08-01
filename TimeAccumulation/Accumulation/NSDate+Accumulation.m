//
//  NSDate+Accumulation.m
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  日期积累

#import "NSDate+Accumulation.h"

@implementation NSDate (Accumulation)

#pragma mark -- 获取当前时间字符串：传入字符串格式
+(NSString *)getCurDateString:(NSString *)dateFormat{
    if (dateFormat==nil ||dateFormat.length == 0) {
        dateFormat = @"yyyyMMddHHmmss";
    }
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *strDate = [dateFormatter stringFromDate:today];
    return strDate;
}

#pragma mark -- 时间格式转换：传入初始格式和目标格式
+(NSString *)changeDateFormat:(NSString *)dateStr from:(NSString *)fromFormat to:(NSString *)toFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:fromFormat];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    [dateFormatter setDateFormat:toFormat];
    return [dateFormatter stringFromDate:date];
}

#pragma mark -- 获取一定数量的天数：天数、开始日期（nil为当天）、之前还是之后
+(NSArray *)getDays:(int)dayCount startDay:(NSString *)startDay before:(BOOL)isBefore{
    NSMutableArray *array = [NSMutableArray new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSDate *dayDate = nil;
    if (startDay==nil) {
        dayDate = [NSDate new];
    }else{
        dayDate = [dateFormatter dateFromString:startDay];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    if (isBefore) {
        for (int i=dayCount-1; i>=0; i--) {
            [adcomps setDay:-i];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:dayDate options:0];
            NSString * month = [dateFormatter stringFromDate:newdate];
            [array addObject:month];
        }
    }else{
        for (int i=0; i<dayCount; i++) {
            [adcomps setDay:-i];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:dayDate options:0];
            NSString * month = [dateFormatter stringFromDate:newdate];
            [array addObject:month];
        }
    }
    return array;
}

#pragma mark -- 获取一定数量的月数：月数、开始月份（nil为当天）、之前还是之后
+(NSArray *)getMonths:(int)monthCount startMonth:(NSString *)startMonth before:(BOOL)isBefore{
    NSMutableArray *array = [NSMutableArray new];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyyMM"];
    NSDate *monthDate = nil;
    if (startMonth==nil) {
        monthDate = [NSDate new];
    }else{
        monthDate = [dateFormatter dateFromString:startMonth];
    }
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    if (isBefore) {
        for (int i=monthCount-1; i>=0; i--) {
            [adcomps setMonth:-i];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:monthDate options:0];
            NSString * month = [dateFormatter stringFromDate:newdate];
            [array addObject:month];
        }
    }else{
        for (int i=0; i<monthCount; i++) {
            [adcomps setMonth:-i];
            NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:monthDate options:0];
            NSString * month = [dateFormatter stringFromDate:newdate];
            [array addObject:month];
        }
    }
    return array;
}

#pragma mark -- 计算两个日期的间隔日期
+(int)gapWithDays:(NSString *)startDate endDay:(NSString *)endDate{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"YYYYMMdd"];
    NSDate *date = [format dateFromString:startDate];
    int interval = [date timeIntervalSinceNow];
    NSDate *date2 = [format dateFromString:endDate];
    int interval2 = [date2 timeIntervalSinceNow];
    return (interval2 - interval)/3600/24;
}

#pragma mark -- 计算两个月份的间隔
+(int)gapWithMonths:(NSString *)startDate endDay:(NSString *)endDate{
    int startYear = [[startDate substringToIndex:4] intValue];
    int startMonth = [[startDate substringFromIndex:4] intValue];
    int endYear = [[endDate substringToIndex:4] intValue];
    int endMonth = [[endDate substringFromIndex:4] intValue];
    return (endYear-startYear)*12+endMonth-startMonth;
}

@end
