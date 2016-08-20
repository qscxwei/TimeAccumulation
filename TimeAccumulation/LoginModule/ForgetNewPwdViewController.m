//
//  ForgetNewPwdViewController.m
//  Engineer
//
//  Created by qscxwei on 16/8/20.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——新密码

#import "ForgetNewPwdViewController.h"

@implementation ForgetNewPwdViewController


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
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 90, SCREEN_WIDTH-40, 40)];
    nameLabel.text = @"请设置新的登录密码";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    [self.view addSubview:nameLabel];
    
    pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 130, SCREEN_WIDTH-40, 50)];
    [UIViewUtil setUITextFieldBaseStyle:pwdTextField];
    pwdTextField.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    pwdTextField.returnKeyType = UIReturnKeyDone;
    pwdTextField.keyboardType = UIKeyboardTypeNumberPad;
    pwdTextField.delegate = self;
    [pwdTextField addTarget:self action:@selector(canNext) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:pwdTextField];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 190, SCREEN_WIDTH-40, 40)];
    tipLabel.textColor = [UIColor COLOR_cccccc];
    tipLabel.font = [UIFont systemFontOfSize:FONT_SIZE-2];
    tipLabel.text = @"备注：请将密码设置为6~18位，并且由字母和数字组合";
    tipLabel.numberOfLines = 2;
    [self.view addSubview:tipLabel];
    
    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, SCREEN_WIDTH-40, 40)];
    [UIViewUtil setUIButtonStyle:nextButton title:@"完成" textColor:[UIColor lightGrayColor] backgroundcolor:[UIColor COLOR_eeeeee]];
    [self.view addSubview:nextButton];
    
    
}

#pragma mark -- UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark -- 下一步
-(void)nextStep{
    
}

#pragma mark -- 验证是否可以下一步
-(void)canNext{
    if([NSString checkPassword:pwdTextField.text]){
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
