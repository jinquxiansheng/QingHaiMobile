//
//  LbsCheckRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "LbsCheckRequest.h"
static     LbsCheckRequest   *manager = nil;

@implementation LbsCheckRequest
+ (LbsCheckRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[LbsCheckRequest alloc] init];} );
    return manager;
}

- (void)checkinWithLng:(NSString *)lng
                   lat:(NSString *)lat
                   gid:(NSString *)gid
               address:(NSString *)address
              callBack:(HttpCallBack *)callback
{
    [self setHttpManager];
    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
    // __weak LoginRequest *bself = self;
    //[self.tokenInfo saveTokenInfo:nil];
    selfCallBack.doneBlock = ^(NSDictionary *result,NSUInteger tag)
    {
        callback.doneBlock (result,1);
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
        callback.failedBlock (error);
        
    };
    self.needSaveCache = NO;
    [self addPostParameter:@"lng" value:lng];
    [self addPostParameter:@"lat" value:lat];
    [self addPostParameter:@"gid" value:gid];
    [self addPostParameter:@"address" value:address];
    self.url = QHMOBILECHECKINURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
@end
