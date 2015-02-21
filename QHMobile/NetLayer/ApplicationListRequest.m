//
//  ApplicationListRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "ApplicationListRequest.h"
static     ApplicationListRequest   *manager = nil;

@implementation ApplicationListRequest
+ (ApplicationListRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[ApplicationListRequest alloc] init];} );
    return manager;
}
- (void)applicationListWithType:(NSString *)type callBack:(HttpCallBack *)callback
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
    [self addPostParameter:@"type" value:type];
    [self addPostParameter:@"page" value:@"1"];
    self.url = QHMOBILECHECKTYPEURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
@end
