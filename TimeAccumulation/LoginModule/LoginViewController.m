//
//  LoginViewController.m
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  登录

#import "LoginViewController.h"


@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    statusBarView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:statusBarView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 40)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    titleLabel.text = @"登录";
    [self.view addSubview:titleLabel];
    
    NSArray *nameArray = @[@"账号",@"密码"];
    for (int i=0; i<nameArray.count; i++) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(25, 100+51*i, 50, 50)];
        [UIViewUtil setUILabelBaseStyle:nameLabel title:nameArray[i]];
        [self.view addSubview:nameLabel];
        UIView *divView = [[UIView alloc]initWithFrame:CGRectMake(20, 150+51*i, SCREEN_WIDTH-40, 1)];
        divView.backgroundColor = [UIColor COLOR_eeeeee];
        [self.view addSubview:divView];
    }
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 100, SCREEN_WIDTH-120, 50)];
    nameTextField.placeholder = @"用户名/手机号/邮箱";
    [self.view addSubview:nameTextField];
    
    pwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(80, 151, SCREEN_WIDTH-120, 50)];
    pwdTextField.placeholder = @"请输入密码";
    pwdTextField.secureTextEntry = YES;
    [self.view addSubview:pwdTextField];
    
    UIButton *loginButton = [[UIButton alloc]initWithFrame:CGRectMake(20, pwdTextField.frame.origin.y+pwdTextField.frame.size.height+50, SCREEN_WIDTH-40, 40)];
    [UIViewUtil setUIButtonStyle:loginButton title:@"登录" backgroundcolor:[UIColor THEME_COLOR]];
    [loginButton addTarget:self action:@selector(loginForCommon) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    UIButton *registerButton = [[UIButton alloc]initWithFrame:CGRectMake(20, loginButton.frame.origin.y+loginButton.frame.size.height+20, 100, 40)];
    [registerButton setTitle:@"手机快速注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [registerButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-2]];
    [registerButton addTarget:self action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    
    UIButton *forgetButton = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, loginButton.frame.origin.y+loginButton.frame.size.height+20, 60, 40)];
    [forgetButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [forgetButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [forgetButton.titleLabel setFont:[UIFont systemFontOfSize:FONT_SIZE-2]];
    [forgetButton addTarget:self action:@selector(toForgetPwd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetButton];
}

#pragma Mark -- 普通登录
-(void)loginForCommon{
    if ([NSString isEmpty:nameTextField.text]) {
//        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if ([NSString isEmpty:pwdTextField.text]) {
//        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    [ViewCtrJump jumpToMainViewCtr];
//    NSDictionary *params = @{@"userName":nameTextField.text,@"pwd":pwdTextField.text};
//    [HttpCommon request:USER_LOGIN param:params complete:^(NSDictionary *resultDic) {
//        NSLog(@"登录：%@",resultDic);
//        if (resultDic) {
//            BOOL success = [[resultDic objectForKey:@"success"] boolValue];
//            if (success) {
//                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//                [userDefaults setBool:YES forKey:IS_LOGIN];
//                [userDefaults setObject:[resultDic objectForKey:USER_ID] forKey:USER_ID];
//                [userDefaults setObject:[resultDic objectForKey:USER_NAME] forKey:USER_NAME];
//                [userDefaults setObject:[resultDic objectForKey:USER_REAL_NAME] forKey:USER_REAL_NAME];
//                [userDefaults setObject:[resultDic objectForKey:@"userPhotoPath"] forKey:USER_IMAGE];
//                [userDefaults setObject:[resultDic objectForKey:@"ITEMS"] forKey:EQGROUP_LIST];
//                [userDefaults synchronize];
//                [ViewCtrJump jumpToMainViewCtr];
//            }else{
//                [SVProgressHUD showErrorWithStatus:@"登录失败"];
//            }
//        }else{
//            [SVProgressHUD showErrorWithStatus:@"登录失败"];
//        }
//    }];
}

#pragma Mark -- 找回密码
-(void)toForgetPwd{
    ForgetPwdViewController *ctr = [ForgetPwdViewController new];
    [self.navigationController pushViewController:ctr animated:YES];
}

#pragma Mark -- 注册
-(void)toRegister{
    RegisterViewController *ctr = [RegisterViewController new];
    [self.navigationController pushViewController:ctr animated:YES];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField==nameTextField) {
        [pwdTextField becomeFirstResponder];
    }else if(textField == pwdTextField){
        [self loginForCommon];
    }
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
