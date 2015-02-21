//
//  AccountListRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "AccountListRequest.h"
static     AccountListRequest   *manager = nil;

@implementation AccountListRequest
+ (AccountListRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[AccountListRequest alloc] init];} );
    return manager;
}
- (void)accountListWithCallBack:(HttpCallBack *)callback
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
    self.url = QHMOBILEACCOUNTLISTURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}

@end
