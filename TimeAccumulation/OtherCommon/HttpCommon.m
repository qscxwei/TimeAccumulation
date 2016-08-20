//
//  HttpCommon.m
//  hlsk
//
//  Created by qscxwei on 16/8/9.
//  Copyright © 2016年 com.connectedtime. All rights reserved.
//  http请求公共

#import "HttpCommon.h"

@implementation HttpCommon

#pragma mark -- 判断联网状态
+(BOOL)isConnectionAvailable{
    
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
    // 2.检测手机是否能上网络(WIFI\3G\2.5G)
    Reachability *conn = [Reachability reachabilityForInternetConnection];
    // 3.判断网络状态
    if ([wifi currentReachabilityStatus] != NotReachable) { // 有wifi
        return YES;
    } else if ([conn currentReachabilityStatus] != NotReachable) { // 没有使用wifi, 使用手机自带网络进行
        return YES;
    } else { // 没有网络
        return NO;
    }
}

#pragma mark -- 请求数据
+(void)request:(NSString *)requestPath param:(NSDictionary *)param complete:(void(^)(id))complete{
//    if ([self isConnectionAvailable]) {
//        AFHTTPSessionManager *messageManager = [AFHTTPSessionManager manager];
//        messageManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        [messageManager POST:requestPath parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers error:nil];
//            complete(resultDic);
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            complete(nil);
//        }];
//    }else{
//        [SVProgressHUD showErrorWithStatus:@"无网络链接"];
//    }
}

@end
