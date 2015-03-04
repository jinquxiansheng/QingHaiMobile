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
#define QHMOBILEACCOUNTLISTURL                               @"financial/items/lists"
#define QHMOBILESUBMITACCOUNTLISTURL                               @"financial/submited/lists"
#define QHMOBILEUSERINFOURL                                 @"user/info/all"


#define QHMOBILECASHLISTURL                                 @"financial/submited/lists/item/cash"
#define QHMOBILECASHDISPATCHERURL                            @"financial/submited/dispatcher/item/cash"
#define  QHMOBILESIMLISTURL                                     @"financial/submited/lists/item/sim"
#define  QHMOBILESIMDISPATCHERURL                               @"financial/submited/dispatcher/item/sim"
#define  QHMOBILECARDLISTURL                                    @"financial/submited/lists/item/card"
#define   QHMOBILECARDDISPATCHERURL                             @"financial/submited/dispatcher/item/card"
#define  QHMOBILETERMINALLISTURL                                @"financial/submited/lists/item/terminal"
#define   QHMOBILETERMINALDISPATCHERURL                         @"financial/submited/dispatcher/item/terminal"

//部门台帐查询
#define  QHMOBILEACCOUNTLISTURL                                 @"manage/home/index"
@interface GlobalUrl : NSObject
+(GlobalUrl *)shareManager;
- (NSString *)configUrl:(NSString *)url;
@end
