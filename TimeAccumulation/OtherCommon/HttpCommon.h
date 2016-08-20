//
//  HttpCommon.h
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  http请求公共

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface HttpCommon : NSObject


#pragma mark -- 判断联网状态
+(BOOL)isConnectionAvailable;

#pragma mark -- 请求数据
+(void)request:(NSString *)requestPath param:(NSDictionary *)param complete:(void(^)(id))complete;


@end
