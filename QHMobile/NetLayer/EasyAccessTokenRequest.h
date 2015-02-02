//
//  AccessTokenRequest.h
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface EasyAccessTokenRequest : QHMBaseRequest
- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
+ (EasyAccessTokenRequest *)shareManager;
- (void)cancel;
@end
