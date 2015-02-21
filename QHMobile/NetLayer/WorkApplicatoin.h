//
//  WorkApplicatoin.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface WorkApplicatoin : QHMBaseRequest
+ (WorkApplicatoin *)shareManager;
- (void)workApplicationWithType:(NSString *)type
                          ctype:(NSString *)ctype
                         s_time:(NSString *)s_time
                         e_time:(NSString *)e_time
                         reason:(NSString *)reason
                       callBack:(HttpCallBack *)callback;

@end
