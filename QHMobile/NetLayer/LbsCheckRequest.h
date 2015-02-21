//
//  LbsCheckRequest.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"

@interface LbsCheckRequest : QHMBaseRequest
- (void)checkinWithLng:(NSString *)lng
                   lat:(NSString *)lat
                   gid:(NSString *)gid
               address:(NSString *)address
              callBack:(HttpCallBack *)callback;
+ (LbsCheckRequest *)shareManager;
@end
