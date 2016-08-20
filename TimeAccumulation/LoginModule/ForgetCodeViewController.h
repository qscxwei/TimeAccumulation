//
//  ForgetCodeViewController.h
//  Engineer
//
//  Created by qscxwei on 16/8/20.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——短信验证码

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"
#import "ForgetNewPwdViewController.h"

@interface ForgetCodeViewController : UIViewController<UITextFieldDelegate>{
    UITextField *codeTextField;//短信验证码
    UIButton *getCodeButton;//获取短信验证码
    UIButton *nextButton;//下一步
    NSTimer *nstimer;
}

@property (nonatomic,strong)NSString *userName;//账户




@end
