//
//  ApplicationListModel.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface ApplicationListModel : BaseModel
@property (nonatomic,copy) NSString *ID;    //记录ID
@property (nonatomic,copy) NSString *ctype; // 申请类型
@property (nonatomic,copy) NSString *ctype_name;// 申请类型名称
@property (nonatomic,copy) NSString *start_time;// 开始时间戳
@property (nonatomic,copy) NSString *end_time;//结束时间戳
@property (nonatomic,copy) NSString *reason;//理由
@property (nonatomic,copy) NSString *statuss;// 0=等待批准 1=批准 -1=驳回
@property (nonatomic,copy) NSString *time;// 申请时间戳
@end
