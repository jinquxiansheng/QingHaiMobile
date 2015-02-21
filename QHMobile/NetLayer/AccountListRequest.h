//
//  AccountListRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface AccountListRequest : QHMBaseRequest
+ (AccountListRequest *)shareManager;
- (void)accountListWithCallBack:(HttpCallBack *)callback;
@end
