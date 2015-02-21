//
//  UserInfoRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "UserInfoRequest.h"
static     UserInfoRequest   *manager = nil;

@implementation UserInfoRequest
+ (UserInfoRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[UserInfoRequest alloc] init];} );
    return manager;
}
- (void)userAllInfoWithCallBack:(HttpCallBack *)callback
{
    [self setHttpManager];
    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
    // __weak LoginRequest *bself = self;
    //[self.tokenInfo saveTokenInfo:nil];
    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
    {
        callback.doneBlock (result,1);
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
        callback.failedBlock (error);
        
    };
    self.needSaveCache = NO;
    self.url = QHMOBILEUSERINFOURL;
    self.requestType = Get;
    [self sendToServer:selfCallBack];
  
}
@end
