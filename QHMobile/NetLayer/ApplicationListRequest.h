//
//  ApplicationListRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface ApplicationListRequest : QHMBaseRequest
+ (ApplicationListRequest *)shareManager;
- (void)applicationListWithType:(NSString *)type callBack:(HttpCallBack *)callback;
- (void)applicationListMoreWithType:(NSString *)type callBack:(HttpCallBack *)callback;

@end
