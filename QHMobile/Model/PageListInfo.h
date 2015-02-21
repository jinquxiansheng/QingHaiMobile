//
//  PageListInfo.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface PageListInfo : BaseModel
@property (nonatomic,copy) NSString *count;
@property (nonatomic,copy) NSString *page;
@end
