//
//  SubmitAccountListModel.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface SubmitAccountListModel : BaseModel

@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *ctype;// 申请类型
@property (nonatomic,copy) NSString *remark;//// 摘要（主显）
@property (nonatomic,copy) NSString *time;//申请时间戳
@property (nonatomic,copy) NSString *url; //详情url
@end
