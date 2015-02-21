//
//  BaseModel.m
//  QHMobile
//
//  Created by yao on 14-8-25.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"id", self.status, @"")

}
@end
