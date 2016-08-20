//
//  RegisterCodeViewController.h
//  Engineer
//
//  Created by qscxwei on 16/8/20.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  手机注册——短信验证码

#import <UIKit/UIKit.h>
#import "TimeAccumulation.h"

@interface RegisterCodeViewController : UIViewController<UITextFieldDelegate>{
    UITextField *codeTextField;//短信验证码
    UIButton *getCodeButton;//获取短信验证码
    UIButton *completeButton;//完成
    NSTimer *nstimer;
}

@property (nonatomic,strong)NSString *phone;//手机号


@end
