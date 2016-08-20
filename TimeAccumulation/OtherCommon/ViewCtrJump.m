//
//  ViewCtrJump.m
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  首页和登录跳转

#import "ViewCtrJump.h"

@implementation ViewCtrJump

//跳转到首页
+(void)jumpToMainViewCtr{
    UITabBarController *tabBarContro = [UITabBarController new];
    
    NSArray *imgArray = @[@"main_1_normal",@"main_2_normal"];
    NSArray *selectImgArray = @[@"main_1_press",@"main_2_press"];
    
    ViewController *mainCtr = [ViewController new];
    mainCtr.title = @"首页";
    mainCtr.tabBarItem.title = @"首页";
    mainCtr.tabBarItem.image = [UIImage imageNamed:imgArray[0]];
    mainCtr.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    mainCtr.tabBarItem.selectedImage = [UIImage imageNamed:selectImgArray[0]];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:mainCtr];
    
    
    UserCenterViewController *userCenterVC = [UserCenterViewController new];
    userCenterVC.title = @"我";
    userCenterVC.tabBarItem.title = @"我";
    userCenterVC.tabBarItem.image = [UIImage imageNamed:imgArray[1]];
    userCenterVC.tabBarItem.selectedImage = [UIImage imageNamed:selectImgArray[1]];
    UINavigationController *userCenterNav = [[UINavigationController alloc] initWithRootViewController:userCenterVC];
    
    NSArray *array = [NSArray arrayWithObjects:mainNav,userCenterNav, nil];
    tabBarContro.viewControllers = array;
    tabBarContro.tabBar.tintColor = [UIColor THEME_COLOR];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = tabBarContro;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor THEME_COLOR]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

//跳转到登录页
+(void)jumpToLoginViewCtr{
    LoginViewController *mainCtr = [LoginViewController new];
    mainCtr.title = @"登录";
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:mainCtr];
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    window.rootViewController = loginNav;
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor THEME_COLOR]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}


@end
