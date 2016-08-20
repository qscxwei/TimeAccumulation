//
//  LoginViewController.h
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  登录

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"
#import "ViewCtrJump.h"
#import "RegisterViewController.h"
#import "ForgetPwdViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>{
    UITextField *nameTextField;//用户名
    UITextField *pwdTextField;//密码
    
}



@end
