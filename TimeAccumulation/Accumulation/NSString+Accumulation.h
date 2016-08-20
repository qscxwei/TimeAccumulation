//
//  NSString+Accumulation.h
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  字符串积累

#import <UIKit/UIKit.h>

@interface NSString (Accumulation)

// 返回字符串所占用的尺寸.
+(CGSize)sizeWithFont:(NSString *)content font:(UIFont *)font maxSize:(CGSize)maxSize;

//获取不同字体颜色的字符串
+(NSAttributedString *)differString:(NSString *)str target:(NSString *)targetStr color:(UIColor *)color font:(UIFont *)font;

// 获取plist文件内容
+(NSArray *)getContentFromPlist:(NSString *)fileName;

// 正则匹配手机号
+(BOOL)checkTelNumber:(NSString*)telNumber;

// 正则匹配身份证号
+(BOOL)checkIDCARDNumber:(NSString*)idCardNumber;

// 正则匹配用户密码6-18位数字和字母组合
+(BOOL)checkPassword:(NSString*)password;

// 正则匹配Email
+(BOOL)checkEmail:(NSString*)email;

// 正则匹配中文姓名
+(BOOL)checkChineseName:(NSString*)name;

// 判断输入框是否为空、是否全为空格
+(BOOL)isEmpty:(NSString *) str;

// 替换字符指定位置(startInd 开始截取len 长度)串为＊
+(NSString *) handXing:(NSString *)str from:(int) startInd to:(int)len;

// 重要信息进行隐藏显示
+(NSString *)hideInfo:(NSString *)str;

//生成验证码，数字、字母组成
+(NSString *)createVerificationCode:(int)length;



@end
