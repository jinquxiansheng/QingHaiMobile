//
//  PageListInfo.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "PageListInfo.h"

@implementation PageListInfo
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"count", self.count, @"")
    _CODE_GETSTRING_(dict, @"page", self.page, @"")

}

@end
