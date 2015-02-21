//
//  LoginRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface LoginRequest : QHMBaseRequest
+ (LoginRequest *)shareManager;
- (void)loginWithName:(NSString *)userName
                  pwd:(NSString *)pwd
             callBack:(HttpCallBack *)callback
               target:(id)target;
@end
