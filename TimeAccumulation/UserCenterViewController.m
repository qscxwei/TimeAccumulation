//
//  UserCenterViewController.m
//  TimeAccumulation
//
//  Created by qscxwei on 16/8/3.
//  Copyright © 2016年 com.cxw. All rights reserved.
//  用户中心

#import "UserCenterViewController.h"

@implementation UserCenterViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"用户中心";
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    bgView.backgroundColor = [UIColor THEME_COLOR];
    [self.view addSubview:bgView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
