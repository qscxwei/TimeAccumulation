//
//  NSString+Accumulation.m
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  字符串积累

#import "NSString+Accumulation.h"

@implementation NSString (Accumulation)

#pragma mark -- 返回字符串所占用的尺寸.
+(CGSize)sizeWithFont:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [content boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

#pragma mark -- 处理请求结果:解码，转nsdictionary
+(NSDictionary *)handleHttpResult:(id)responseObject{
    NSData *doubi = responseObject;
    NSString *s =  [[NSString alloc]initWithData:doubi encoding:NSUTF8StringEncoding];
    NSUInteger length = s.length;
    NSRange range = NSMakeRange(5, length-7);
    s = [s substringWithRange:range];
    NSError *error = nil;
    NSDictionary *string2dic = [NSJSONSerialization JSONObjectWithData: [s dataUsingEncoding:NSUTF8StringEncoding] options: NSJSONReadingMutableContainers error: &error];
    return string2dic;
}

#pragma mark -- 获取plist文件内容
+(NSArray *)getContentFromPlist:(NSString *)fileName{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *array = [[NSArray alloc] initWithContentsOfFile:plistPath];
    return array;
}

#pragma mark -- 正则匹配手机号
+(BOOL)checkTelNumber:(NSString*)telNumber{
    NSString *regex = @"1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|7[06-8])\\d{8}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [predicate evaluateWithObject:telNumber];
    return isMatch;
}

#pragma mark -- 正则匹配用户密码6-18位数字和字母组合
+(BOOL)checkPassword:(NSString*)password{
    NSString *pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}
#pragma mark -- 正则匹配身份证号
+(BOOL)checkIDCARDNumber:(NSString*)idCardNumber{
    BOOL flag;
    if (idCardNumber.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [predicate evaluateWithObject:idCardNumber];
    return isMatch;
}

#pragma mark -- 正则匹配email
+(BOOL)checkEmail:(NSString*)email{
    NSString *regex = @"A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [predicate evaluateWithObject:email];
    return isMatch;
}
#pragma mark -- 正则匹配中文名
+(BOOL)checkChineseName:(NSString*)name{
    NSString *regex = @"^[\u4e00-\u9fa5]{2,8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch  = [predicate evaluateWithObject:name];
    return isMatch;
}

#pragma mark -- 正则匹配身份证号
+(BOOL)checkIDCardNumber:(NSString*)idcard{
    idcard = [idcard stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    long length =0;
    if (!idcard) {
        return NO;
    }else {
        length = idcard.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [idcard substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return NO;
    }
    
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [idcard substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:idcard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idcard.length)];
            
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [idcard substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:idcard
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, idcard.length)];
            if(numberofMatch >0) {
                int S = ([idcard substringWithRange:NSMakeRange(0,1)].intValue + [idcard substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([idcard substringWithRange:NSMakeRange(1,1)].intValue + [idcard substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([idcard substringWithRange:NSMakeRange(2,1)].intValue + [idcard substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([idcard substringWithRange:NSMakeRange(3,1)].intValue + [idcard substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([idcard substringWithRange:NSMakeRange(4,1)].intValue + [idcard substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([idcard substringWithRange:NSMakeRange(5,1)].intValue + [idcard substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([idcard substringWithRange:NSMakeRange(6,1)].intValue + [idcard substringWithRange:NSMakeRange(16,1)].intValue) *2 + [idcard substringWithRange:NSMakeRange(7,1)].intValue *1 + [idcard substringWithRange:NSMakeRange(8,1)].intValue *6 + [idcard substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[idcard substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}

#pragma mark -- 判断内容是否全部为空格  yes 全部为空格  no 不是
+(BOOL) isEmpty:(NSString *) str {
    
    if (!str || str==nil || [str isEqualToString:@"null"] || [str isEqualToString:@""]) {
        return true;
    } else {
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimedString = [str stringByTrimmingCharactersInSet:set];
        
        if ([trimedString length] == 0) {
            return true;
        } else {
            return false;
        }
    }
}

#pragma mark -- 替换字符指定位置(startInd 开始截取len 长度)串为＊
+(NSString *) handXing:(NSString *)str from:(int) startInd to:(int)len{
    if ([self isEmpty:str]) {
        return str;
    }else{
        NSString * tempXing = @"";
        for(int i=0;i<len;i++){
            tempXing = [tempXing stringByAppendingString:@"*"];
        }
        return [str stringByReplacingCharactersInRange:NSMakeRange(startInd, len) withString:tempXing];
    }
    
}

#pragma mark -- 重要信息进行隐藏显示
+(NSString *)hideInfo:(NSString *)str{
    if (!str || str == nil || [str isEqualToString:@""]) {
        return @"-";
    }else if (str.length >= 11){
        return [NSString stringWithFormat:@"%@****%@",[str substringWithRange:NSMakeRange(0, 3)],[str substringWithRange:NSMakeRange(str.length-4, 4)]];
    }else if (str.length >= 9){
        return [NSString stringWithFormat:@"%@****%@",[str substringWithRange:NSMakeRange(0, 3)],[str substringWithRange:NSMakeRange(str.length-3, 3)]];
    }else if (str.length >= 6){
        return [NSString stringWithFormat:@"%@***%@",[str substringWithRange:NSMakeRange(0, 2)],[str substringWithRange:NSMakeRange(str.length-2, 2)]];
    }else if (str.length >= 3){
        return [NSString stringWithFormat:@"%@***",[str substringWithRange:NSMakeRange(0, 2)]];
    } else {
        return [NSString stringWithFormat:@"%@***",[str substringWithRange:NSMakeRange(0, 1)]];
    }
}

@end
