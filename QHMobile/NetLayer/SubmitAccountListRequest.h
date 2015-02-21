//
//  SubmitAccountListRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface SubmitAccountListRequest : QHMBaseRequest
+ (SubmitAccountListRequest *)shareManager;
- (void)submitApplicationListWithItem:(NSString *)item  callBack:(HttpCallBack *)callback;
- (void)submitApplicationListMoreWithItem:(NSString *)item  callBack:(HttpCallBack *)callback;

@end
