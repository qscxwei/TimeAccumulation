//
//  ForgetNewPwdViewController.h
//  Engineer
//
//  Created by qscxwei on 16/8/20.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——新密码

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"

@interface ForgetNewPwdViewController : UIViewController<UITextFieldDelegate>{
    UITextField *pwdTextField;//密码
    UIButton *nextButton;//完成
}

@end
