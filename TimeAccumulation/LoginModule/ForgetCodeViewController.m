//
//  ForgetCodeViewController.m
//  Engineer
//
//  Created by qscxwei on 16/8/20.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——短信验证码

#import "ForgetCodeViewController.h"

@implementation ForgetCodeViewController



-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor COLOR_f8f8f8];
    
    UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    titleLabel.text = @"找回密码";
    [titleView addSubview:titleLabel];
    
    UIView *divView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
    divView.backgroundColor = [UIColor COLOR_eeeeee];
    [titleView addSubview:divView];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 4, 36, 36)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:backButton];
    
    UILabel *userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 90, SCREEN_WIDTH-40, 40)];
    userNameLabel.text = [NSString stringWithFormat:@"用户名：%@",_userName];
    userNameLabel.textColor = [UIColor blackColor];
    userNameLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    [self.view addSubview:userNameLabel];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 140, SCREEN_WIDTH-40, 40)];
    tipLabel.text = [NSString stringWithFormat:@"请输入 %@ 收到的短信验证码：",[NSString hideInfo:_userName]];
    tipLabel.textColor = [UIColor redColor];
    tipLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    [self.view addSubview:tipLabel];
    
    codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, SCREEN_WIDTH-180, 50)];
    [UIViewUtil setUITextFieldBaseStyle:codeTextField];
    codeTextField.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    codeTextField.returnKeyType = UIReturnKeyDone;
    codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    codeTextField.delegate = self;
    [codeTextField addTarget:self action:@selector(canNext) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:codeTextField];
    
    getCodeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-140, 180, 120, 50)];
    [UIViewUtil setUIButtonStyle:getCodeButton title:[NSString stringWithFormat:@"重新发送(%d秒)",timeCount] textColor:[UIColor lightGrayColor] backgroundcolor:[UIColor COLOR_eeeeee]];
    [self.view addSubview:getCodeButton];
    
    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, SCREEN_WIDTH-40, 40)];
    [UIViewUtil setUIButtonStyle:nextButton title:@"下一步" textColor:[UIColor lightGrayColor] backgroundcolor:[UIColor COLOR_eeeeee]];
    [self.view addSubview:nextButton];
    
    nstimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    [nstimer fire];
    
}

#pragma mark -- UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark -- 倒计时
-(void)timerHandle{
    static int i = timeCount;
    i--;
    if (i == 0){
        [nstimer invalidate];
        nstimer = nil;
        [getCodeButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [getCodeButton setBackgroundColor:[UIColor THEME_COLOR]];
        [getCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [getCodeButton addTarget:self action:@selector(sendCodeAgain) forControlEvents:UIControlEventTouchUpInside];
        i = timeCount;
    }else{
        [getCodeButton setTitle:[NSString stringWithFormat:@"重新发送(%d秒)",i] forState:UIControlStateNormal];
        [getCodeButton setBackgroundColor:[UIColor COLOR_eeeeee]];
        [getCodeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [getCodeButton removeTarget:self action:@selector(sendCodeAgain) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -- 重新发送验证码
-(void)sendCodeAgain{
    codeTextField.text = @"";
    nstimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerHandle) userInfo:nil repeats:YES];
    [nstimer fire];
}

#pragma mark -- 下一步
-(void)nextStep{
    ForgetNewPwdViewController *ctr = [ForgetNewPwdViewController new];
    [self.navigationController pushViewController:ctr animated:YES];
}


#pragma mark -- 验证是否可以完成
-(void)canNext{
    if(codeTextField.text.length >=4){
        nextButton.backgroundColor = [UIColor THEME_COLOR];
        [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [nextButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }else{
        nextButton.backgroundColor = [UIColor COLOR_eeeeee];
        [nextButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [nextButton removeTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark - 返回
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
