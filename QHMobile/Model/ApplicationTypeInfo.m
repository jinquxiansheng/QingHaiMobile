//
//  ApplicationTypeInfo.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "ApplicationTypeInfo.h"

@implementation ApplicationTypeInfo
- (void)attachToDictionary:(NSDictionary *)dict
{
    
    _CODE_GETCHINESESTRING_(dict, @"name", self.name, @"")
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    
}

@end
