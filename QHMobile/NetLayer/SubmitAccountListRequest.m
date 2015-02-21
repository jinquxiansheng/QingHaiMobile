//
//  SubmitAccountListRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SubmitAccountListRequest.h"
static     SubmitAccountListRequest   *manager = nil;

@implementation SubmitAccountListRequest
+ (SubmitAccountListRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[SubmitAccountListRequest alloc] init];} );
    return manager;
}
- (void)submitApplicationListWithItem:(NSString *)item  callBack:(HttpCallBack *)callback
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
    [self addPostParameter:@"item" value:item];
    [self addPostParameter:@"page" value:@"1"];
    self.url = QHMOBILESUBMITACCOUNTLISTURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
- (void)submitApplicationListMoreWithItem:(NSString *)item  callBack:(HttpCallBack *)callback
{
    
}
@end
