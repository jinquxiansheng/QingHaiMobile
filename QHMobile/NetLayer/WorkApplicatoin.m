//
//  WorkApplicatoin.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "WorkApplicatoin.h"
static     WorkApplicatoin   *manager = nil;

@implementation WorkApplicatoin
+ (WorkApplicatoin *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[WorkApplicatoin alloc] init];} );
    return manager;
}
- (void)workApplicationWithType:(NSString *)type
                          ctype:(NSString *)ctype
                         s_time:(NSString *)s_time
                         e_time:(NSString *)e_time
                         reason:(NSString *)reason
                       callBack:(HttpCallBack *)callback
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
    [self addPostParameter:@"ctype" value:ctype];
    [self addPostParameter:@"start_time" value:s_time];
    [self addPostParameter:@"end_time" value:e_time];
    [self addPostParameter:@"reason" value:reason];
    self.url = QHMOBILEAPPLICATIONURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
@end
