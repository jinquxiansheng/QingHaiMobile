//
//  ApplicationListModel.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "ApplicationListModel.h"

@implementation ApplicationListModel
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    _CODE_GETSTRING_(dict, @"ctype", self.ctype, @"")
    _CODE_GETCHINESESTRING_(dict, @"ctype_name", self.ctype_name, @"")
    _CODE_GETSTRING_(dict, @"start_time", self.start_time, @"")
    _CODE_GETSTRING_(dict, @"end_time", self.end_time, @"")
    _CODE_GETCHINESESTRING_(dict, @"reason", self.reason, @"")
    _CODE_GETSTRING_(dict, @"status", self.statuss, @"")
    _CODE_GETSTRING_(dict, @"time", self.time, @"")

}
@end
