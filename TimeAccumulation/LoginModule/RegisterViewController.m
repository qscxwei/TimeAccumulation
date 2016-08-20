//
//  RegisterViewController.m
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  手机注册——手机号

#import "RegisterViewController.h"

@implementation RegisterViewController

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
    titleLabel.text = @"手机快速注册";
    [titleView addSubview:titleLabel];
    
    UIView *divView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
    divView.backgroundColor = [UIColor COLOR_eeeeee];
    [titleView addSubview:divView];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(5, 4, 36, 36)];
    [backButton setBackgroundImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:backButton];
    
    
    phoneTextField = [[UITextField alloc]initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH-40, 50)];
    [UIViewUtil setUITextFieldStyle:phoneTextField withName:@"手机号：" nameWidth:60 borderColor:[UIColor whiteColor] backgroundColor:[UIColor whiteColor] textColor:[UIColor darkGrayColor]];
    phoneTextField.layer.borderColor = [UIColor COLOR_eeeeee].CGColor;
    phoneTextField.returnKeyType = UIReturnKeyDone;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextField.delegate = self;
    [phoneTextField addTarget:self action:@selector(canNext) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:phoneTextField];
    
    agreeButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 165, 30, 30)];
    [agreeButton setImage:[UIImage imageNamed:@"radio_focus"] forState:UIControlStateNormal];
    agreeButton.tag = 1;//1-选中，2-未选中
    [agreeButton addTarget:self action:@selector(radioChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeButton];
    
    UILabel *agreeLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 165, SCREEN_WIDTH-70, 30)];
    agreeLabel.textColor = [UIColor lightGrayColor];
    agreeLabel.font = [UIFont systemFontOfSize:FONT_SIZE-1];
    agreeLabel.attributedText = [NSString differString:@"同意注册协议" target:@"注册协议" color:[UIColor blackColor] font:[UIFont systemFontOfSize:FONT_SIZE-1]];
    [self.view addSubview:agreeLabel];
    
    nextButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 240, SCREEN_WIDTH-40, 40)];
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
    RegisterCodeViewController *ctr = [RegisterCodeViewController new];
    ctr.phone = phoneTextField.text;
    [self.navigationController pushViewController:ctr animated:YES];
}

#pragma makr -- 单选按钮选中效果
-(void)radioChange:(UIButton *)button{
    if (button.tag == 1) {
        [button setImage:[UIImage imageNamed:@"radio_normal"] forState:UIControlStateNormal];
        button.tag = 2;
    }else{
        [button setImage:[UIImage imageNamed:@"radio_focus"] forState:UIControlStateNormal];
        button.tag = 1;
    }
    [self canNext];
}

#pragma mark -- 验证是否可以下一步
-(void)canNext{
    if(agreeButton.tag == 1 && [NSString checkTelNumber:phoneTextField.text]){
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
