//
//  ApplicationInfo.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "ApplicationInfo.h"

@implementation ApplicationInfo
 - (void)attachToDictionary:(NSDictionary *)dict
{
    
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    _CODE_GETSTRING_(dict, @"type", self.type, @"")
    _CODE_GETCHINESESTRING_(dict, @"tname", self.tname, @"")
    _CODE_GETSTRING_(dict, @"gid", self.gid, @"")
    _CODE_GETCHINESESTRING_(dict, @"gname", self.gname, @"")
    _CODE_GETSTRING_(dict, @"signtime", self.signtime, @"")
    _CODE_GETCHINESESTRING_(dict, @"address", self.address, @"")
    _CODE_GETSTRING_(dict, @"lng", self.lng, @"")
    _CODE_GETSTRING_(dict, @"lat", self.lat, @"")
}
@end
