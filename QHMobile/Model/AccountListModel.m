//
//  AccountListModel.m
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "AccountListModel.h"

@implementation AccountListModel
- (void)attachToDictionary:(NSDictionary *)dict
{
    _CODE_GETSTRING_(dict, @"id", self.ID, @"")
    _CODE_GETCHINESESTRING_(dict, @"name", self.name, @"")
    _CODE_GETSTRING_(dict, @"form_url", self.form_url, @"")
    _CODE_GETSTRING_(dict, @"list_url", self.list_url, @"")


}
@end
