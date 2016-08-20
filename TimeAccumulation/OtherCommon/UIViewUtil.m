//
//  UIViewUtil.m
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//

#import "UIViewUtil.h"

@implementation UIViewUtil

#pragma Mark -- UITextField
//获取视图的左侧间距
+(UIView *)leftView:(UIView *)view{
    CGRect frame = [view frame];
    frame.size.width = 7.0f;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    return leftview;
}

//textfield内部左侧显示汉字提示
+(void)setUITextFieldStyle:(UITextField *)textfield withName:(NSString *)name nameWidth:(CGFloat)nameWidth borderColor:(UIColor *)borderColor backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor{
    
    UIView *leftBackView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, nameWidth+10, textfield.frame.size.height)];
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, nameWidth+5, textfield.frame.size.height)];
    leftView.backgroundColor = borderColor;
    [leftBackView addSubview:leftView];
    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, nameWidth, textfield.frame.size.height)];
    leftLabel.text = name;
    leftLabel.textColor = textColor;
    leftLabel.font = [UIFont systemFontOfSize:15];
    leftLabel.backgroundColor = borderColor;
    [leftView addSubview:leftLabel];
    textfield.leftViewMode = UITextFieldViewModeAlways;
    textfield.leftView = leftBackView;
    
    textfield.layer.borderColor = borderColor.CGColor;
    textfield.layer.borderWidth = 1;
    textfield.layer.cornerRadius = 3;
    textfield.backgroundColor = backgroundColor;
}

//textfield设置右侧按钮
+(void)setUITextFieldRightButton:(UITextField *)textfield withName:(NSString *)name nameWidth:(CGFloat)nameWidth backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor{
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, nameWidth+5, textfield.frame.size.height)];
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, nameWidth, textfield.frame.size.height)];
    [leftBtn setTitle:name forState:UIControlStateNormal];
    leftBtn.tag = 1;
    [leftBtn setTitleColor:textColor forState:UIControlStateNormal];
    leftBtn.backgroundColor = backgroundColor;
    [leftBtn.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    [leftView addSubview:leftBtn];
    textfield.rightViewMode = UITextFieldViewModeAlways;
    textfield.rightView = leftView;

}

//设置uitextfield基本样式
+(void)setUITextFieldBaseStyle:(UITextField *)textfield{
    textfield.layer.borderColor = [UIColor COLOR_dddddd].CGColor;
    textfield.layer.borderWidth = 1;
    textfield.layer.cornerRadius = 3;
    [textfield setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    CGRect frame = [textfield frame];
    frame.size.width = 7.0f;
    UIView *leftview = [[UIView alloc] initWithFrame:frame];
    textfield.leftViewMode = UITextFieldViewModeAlways;
    textfield.leftView = leftview;
    textfield.backgroundColor = [UIColor whiteColor];
}

//设置uitextfield右侧输入样式
+(void)setUITextFieldStyleRight:(UITextField *)textfield{
    textfield.layer.cornerRadius = 3;
    textfield.textAlignment = NSTextAlignmentRight;
    [textfield setFont:[UIFont systemFontOfSize:FONT_SIZE]];
    CGRect frame = [textfield frame];
    frame.size.width = 7.0f;
    UIView *rightview = [[UIView alloc] initWithFrame:frame];
    textfield.rightViewMode = UITextFieldViewModeAlways;
    textfield.rightView = rightview;
    textfield.backgroundColor = [UIColor whiteColor];
}

#pragma Mark -- UILabel

//设置UILabel基本样式
+(void)setUILabelBaseStyle:(UILabel *)label title:(NSString *)title{
    label.textColor = [UIColor darkGrayColor];
    label.font = [UIFont systemFontOfSize:FONT_SIZE];
    label.text = title;
}

//设置UILabel样式，设置字体颜色
+(void)setUILabelStyle:(UILabel *)label title:(NSString *)title textColor:(UIColor *)textcolor{
    label.textColor = textcolor;
    label.font = [UIFont systemFontOfSize:FONT_SIZE];
    label.text = title;
}

#pragma Mark -- UIButton

//设置UIButton基本样式
+(void)setUIButtonBaseStyle:(UIButton *)button title:(NSString *)title{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 3;
    [button.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-1]];
}

//设置UIButton样式：背景填充，字体白色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title backgroundcolor:(UIColor *)backgroundcolor{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.backgroundColor = backgroundcolor;
    [button.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-1]];
}

//设置UIButton样式：背景填充，字体颜色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title textColor:(UIColor *)textColor backgroundcolor:(UIColor *)backgroundcolor{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.backgroundColor = backgroundcolor;
    [button.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-1]];
}

//设置UIButton样式：背景白色，字体和边框一样颜色
+(void)setUIButtonStyle:(UIButton *)button title:(NSString *)title textColor:(UIColor *)textColor{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.layer.cornerRadius = 3;
    button.layer.borderColor = textColor.CGColor;
    button.layer.borderWidth = 1;
    button.backgroundColor = [UIColor whiteColor];
    [button.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-1]];
}


//设置虚线边框
+(void)boundingRectangleForView:(UIView *)fatherView color:(UIColor *)color{
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = color.CGColor;
    borderLayer.path = [UIBezierPath bezierPathWithRect:fatherView.bounds].CGPath;
    borderLayer.lineWidth = 2.0f;
    borderLayer.lineCap = @"square";
    borderLayer.lineDashPattern = @[@6, @6];
    [fatherView.layer addSublayer:borderLayer];
}

@end
