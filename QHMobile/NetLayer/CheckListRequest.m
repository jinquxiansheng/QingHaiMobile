//
//  CheckListRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "CheckListRequest.h"
static     CheckListRequest   *manager = nil;

@implementation CheckListRequest
+ (CheckListRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[CheckListRequest alloc] init];} );
    return manager;
}
- (void)checkListWithPage:(NSString *)page  callBack:(HttpCallBack *)callback
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
    [self addPostParameter:@"page" value:page];
    self.url = QHMOBILECHECKLISTURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
- (void)checkListMoreWithPage:(NSString *)page callBack:(HttpCallBack *)callback
{
    
}
@end
