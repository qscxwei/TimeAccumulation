//
//  BaseViewController.m
//  DemoDesign
//
//  Created by qscxwei on 16/7/18.
//  Copyright © 2016年 com.connected. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.tabBarController.tabBar.hidden = NO;
}


-(void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
