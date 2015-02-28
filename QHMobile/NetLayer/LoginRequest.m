//
//  LoginRequest.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "LoginRequest.h"
static     LoginRequest   *manager = nil;

@implementation LoginRequest
+ (LoginRequest *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[LoginRequest alloc] init];} );
    return manager;
}
- (void)loginWithName:(NSString *)userName pwd:(NSString *)pwd  callBack:(HttpCallBack *)callback target:(id)target
{
    [self setHttpManager];
    self.target = target;
    self.loadingText = @"加载中";
    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
   // __weak LoginRequest *bself = self;
    //[self.tokenInfo saveTokenInfo:nil];
    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
    {
//        NSArray *resultArray = [result objectForKey:@"items"];
//        NSMutableArray *resultReturn = [[NSMutableArray alloc] init];
//        NSLog(@"%@",resultArray);
//        for (NSDictionary *dict in resultArray) {
//            BrandModel *model = [[BrandModel alloc] init];
//            [model attachToDictionary:dict];
//            [resultReturn addObject:model];
//        }
//        
//        if (bself.needSaveCache)
//        {
//            [bself saveCache:result];
//        }
        
        BaseModel *info = [[BaseModel alloc] init];
        [info attachToDictionary:result];
        callback.doneBlock (info,1);
    };
    selfCallBack.failedBlock = ^(NSError *error)
    {
        callback.failedBlock (error);
        
        
    };
    self.needSaveCache = NO;
    [self addPostParameter:@"phone" value:userName];
    [self addPostParameter:@"password" value:pwd];
    self.url = QHMOBILELOGINURL;
    self.requestType = Post;
    [self sendToServer:selfCallBack];
    
}
@end
