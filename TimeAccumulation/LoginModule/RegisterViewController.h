//
//  RegisterViewController.h
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  手机注册——手机号

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"
#import "RegisterCodeViewController.h"

@interface RegisterViewController : UIViewController<UITextFieldDelegate>{
    UITextField *phoneTextField;//手机号
    UIButton *agreeButton;//同意协议
    UIButton *nextButton;//下一步
}

@end
