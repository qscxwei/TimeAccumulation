//
//  common.h
//  TimeAccumulation
//
//  Created by qscxwei on 16/7/29.
//  Copyright © 2016年 com.cxw. All rights reserved.
//

#ifndef common_h
#define common_h

#import "NSDate+Accumulation.h"
#import "NSString+Accumulation.h"
#import "UIColor+Accumulation.h"


static const int timeCount=60;//发送短信验证码倒计时时间
static const int PAGE_LIMIT = 25;//分页大小
static const int FONT_SIZE = 15;//默认字体大小

//设备屏幕宽高
#define SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT	[UIScreen mainScreen].bounds.size.height

//基础字体大小
#define MAIN_FONT [UIFont systemFontOfSize:FONT_SIZE]





#endif /* common_h */
