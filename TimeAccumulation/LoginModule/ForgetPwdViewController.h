//
//  ForgetPwdViewController.h
//  Engineer
//
//  Created by qscxwei on 16/8/18.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——用户名

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"
#import "ForgetCodeViewController.h"


@interface ForgetPwdViewController : UIViewController<UITextFieldDelegate>{
    UITextField *nameTextField;//账户
    UITextField *codeTextField;//输入验证码
    UIButton *getCodeButton;//显示验证码
    UIButton *nextButton;//下一步
}

@end
