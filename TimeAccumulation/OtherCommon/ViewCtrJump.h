//
//  ViewCtrJump.h
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  首页和登录跳转

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"
#import "LoginViewController.h"
#import "ViewController.h"
#import "UserCenterViewController.h"

@interface ViewCtrJump : NSObject

//跳转到首页
+(void)jumpToMainViewCtr;

//跳转到登录页
+(void)jumpToLoginViewCtr;

@end
