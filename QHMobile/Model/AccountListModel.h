//
//  AccountListModel.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface AccountListModel : BaseModel
@property (nonatomic,copy) NSString *ID;    //记录ID
@property (nonatomic,copy) NSString *name;  // 名称
@property (nonatomic,copy) NSString *form_url;// 表单地址
@property (nonatomic,copy) NSString *list_url;// 列表地址

@end
