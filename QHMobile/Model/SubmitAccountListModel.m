//
//  SubmitAccountListModel.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SubmitAccountListModel.h"

@implementation SubmitAccountListModel
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    _CODE_GETCHINESESTRING_(dict, @"remark", self.remark, @"")
    _CODE_GETSTRING_(dict, @"ctype", self.ctype, @"")
    _CODE_GETSTRING_(dict, @"time", self.time, @"")
    _CODE_GETSTRING_(dict, @"url", self.url, @"")


}
@end
