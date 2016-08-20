//
//  UIViewUtil.h
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"

@interface UIViewUtil : NSObject

//获取视图的左侧间距
+(UIView *)leftView:(UIView *)view;

//textfield内部左侧显示汉字提示
+(void)setUITextFieldStyle:(UITextField *)textfield withName:(NSString *)name nameWidth:(CGFloat)nameWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor;
//textfield设置右侧按钮
+(void)setUITextFieldRightButton:(UITextField *)textfield withName:(NSString *)name nameWidth:(CGFloat)nameWidth backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor;

//设置uitextfield基本样式
+(void)setUITextFieldBaseStyle:(UITextField *)textfield;

//设置uitextfield右侧输入样式
+(void)setUITextFieldStyleRight:(UITextField *)textfield;

//设置UILabel基本样式
+(void)setUILabelBaseStyle:(UILabel *)label title:(NSString *)title;

//设置UILabel样式，设置字体颜色
+(void)setUILabelStyle:(UILabel *)label title:(NSString *)title textColor:(UIColor *)textcolor;

//设置UIButton基本样式
+(void)setUIButtonBaseStyle:(UIButton *)button title:(NSString *)title;

//设置UIButton样式：背景填充，字体白色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title backgroundcolor:(UIColor *)backgroundcolor;

//设置UIButton样式：背景填充，字体颜色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title textColor:(UIColor *)textColor backgroundcolor:(UIColor *)backgroundcolor;

//设置UIButton样式：背景白色，字体和边框一样颜色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title textColor:(UIColor *)textColor;

//设置虚线边框
+(void)boundingRectangleForView:(UIView *)fatherView color:(UIColor *)color;

@end
