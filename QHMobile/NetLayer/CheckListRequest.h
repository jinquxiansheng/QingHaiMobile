//
//  CheckListRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface CheckListRequest : QHMBaseRequest
+ (CheckListRequest *)shareManager;
- (void)checkListWithPage:(NSString *)page  callBack:(HttpCallBack *)callback;
- (void)checkListMoreWithPage:(NSString *)page callBack:(HttpCallBack *)callback;
@end
