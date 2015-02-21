//
//  UserInfoModel.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    _CODE_GETCHINESESTRING_(dict, @"userName", self.userName, @"")
    _CODE_GETSTRING_(dict, @"phone", self.phone, @"")
    _CODE_GETSTRING_(dict, @"mail", self.mail, @"")
    _CODE_GETSTRING_(dict, @"number", self.number, @"")

}

@end
