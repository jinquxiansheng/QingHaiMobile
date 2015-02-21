//
//  SelectDepartmentRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SelectDepartmentRequest.h"
static     SelectDepartmentRequest   *manager = nil;

@implementation SelectDepartmentRequest
+ (SelectDepartmentRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[SelectDepartmentRequest alloc] init];} );
    return manager;
}
- (void)selectDepartmentWithID:(NSString *)ID callBack:(HttpCallBack *)callback
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
    [self addPostParameter:@"department" value:ID];
    self.url = QHMOBILESELECTDEPARTMENTURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];

}
@end
