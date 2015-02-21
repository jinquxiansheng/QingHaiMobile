//
//  UserInfoModel.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface UserInfoModel : BaseModel
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *phone;
@property (nonatomic,copy)NSString *mail;
@property (nonatomic,copy)NSString *number;
@end
