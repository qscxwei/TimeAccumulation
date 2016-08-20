//
//  ForgetPwdViewController.m
//  Engineer
//
//  Created by qscxwei on 16/8/18.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  找回密码——用户名

#import "ForgetPwdViewController.h"

@implementation ForgetPwdViewController

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
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 50)];
    [UIViewUtil setUITextFieldStyle:nameTextField withName:@"账号" nameWidth:60 borderColor:[UIColor whiteColor] backgroundColor:[UIColor whiteColor] textColor:[UIColor darkGrayColor]];
    nameTextField.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    nameTextField.placeholder = @"用户名/手机号/邮箱";
    nameTextField.returnKeyType = UIReturnKeyDone;
    nameTextField.keyboardType = UIKeyboardTypeNumberPad;
    nameTextField.delegate = self;
    [nameTextField addTarget:self action:@selector(canNext) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:nameTextField];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(20, 170, SCREEN_WIDTH-40, 50)];
    bgView.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    bgView.layer.borderWidth = 1;
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-140, 50)];
    [UIViewUtil setUITextFieldBaseStyle:codeTextField];
    codeTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    codeTextField.returnKeyType = UIReturnKeyDone;
    codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    codeTextField.delegate = self;
    codeTextField.placeholder = @"请输入验证码";
    [codeTextField addTarget:self action:@selector(canNext) forControlEvents:UIControlEventEditingChanged];
    [bgView addSubview:codeTextField];
    
    UIView *codeDivView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-140, 10, 1, 30)];
    codeDivView.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:codeDivView];
    
    getCodeButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-140, 0, 100, 50)];
    [getCodeButton setTitle:[NSString createVerificationCode:4] forState:UIControlStateNormal];
    [getCodeButton setTitleColor:[UIColor THEME_COLOR] forState:UIControlStateNormal];
    [getCodeButton.titleLabel setFont:[UIFont fontWithName:@"Marker Felt" size:FONT_SIZE+2]];
    [getCodeButton addTarget:self action:@selector(newCode) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:getCodeButton];
    
    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 260, SCREEN_WIDTH-40, 40)];
    [UIViewUtil setUIButtonStyle:nextButton title:@"下一步" textColor:[UIColor lightGrayColor] backgroundcolor:[UIColor COLOR_eeeeee]];
    [self.view addSubview:nextButton];
}


#pragma mark -- UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark -- 下一步
-(void)nextStep{
    ForgetCodeViewController *ctr = [ForgetCodeViewController new];
    ctr.userName = nameTextField.text;
    [self.navigationController pushViewController:ctr animated:YES];
}


#pragma mark -- 验证是否可以下一步
-(void)canNext{
    //去空格，忽略大小写
    NSString *codeStr = [getCodeButton.titleLabel.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    if(nameTextField.text.length>0 && [[codeTextField.text uppercaseString]isEqualToString:[codeStr uppercaseString]]){
        nextButton.backgroundColor = [UIColor THEME_COLOR];
        [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [nextButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }else{
        nextButton.backgroundColor = [UIColor COLOR_eeeeee];
        [nextButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [nextButton removeTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark -- 生成新的验证码
-(void)newCode{
    [getCodeButton setTitle:[NSString createVerificationCode:4] forState:UIControlStateNormal];
}

#pragma mark - 返回
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
