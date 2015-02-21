//
//  GlobalUrl.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "GlobalUrl.h"
#define domain       @"http://cmcc.fengcms.com/"
static  GlobalUrl     *manager = nil;

@implementation GlobalUrl
//- (void)requestUrl:(NSString)
+(GlobalUrl *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[GlobalUrl alloc] init];} );
    return manager;
}
- (NSString *)configUrl:(NSString *)url;
{
    //NSString *rUrl = [NSString stringWithFormat:@"%@%@",domain,url];
    
    return [NSString stringWithFormat:@"%@%@",domain,url];
}

@end
