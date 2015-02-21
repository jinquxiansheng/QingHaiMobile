//
//  GlobalUrl.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define QHMOBILELOGINURL                                    @"user/login/dispatcher"
#define QHMOBILECHECKINURL                                  @"sign/lbs/dispatcher"
#define QHMOBILESELECTDEPARTMENTURL                         @"user/login/department"
#define QHMOBILECHECKLISTURL                                 @"sign/lists"
#define QHMOBILECHECKTYPEURL                                  @"sign/application/ctype"
#define QHMOBILEAPPLICATIONURL                                @"sign/application/dispatcher"
#define QHMOBILEAPPLICATIONLISTURL                             @"sign/application/lists"
#define QHMOBILEACCOUNTLISTURL                               @"/financial/items/lists"
#define QHMOBILESUBMITACCOUNTLISTURL                               @"/financial/submited/lists"
#define QHMOBILEUSERINFOURL                                 @"user/info/all"
@interface GlobalUrl : NSObject
+(GlobalUrl *)shareManager;
- (NSString *)configUrl:(NSString *)url;
@end
