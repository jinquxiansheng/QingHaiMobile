//
//  ApplicationInfo.h
//  QHMobile
//
//  Created by yao on 15/2/15.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "BaseModel.h"

@interface ApplicationInfo : BaseModel

@property (nonatomic,copy) NSString *ID;   // 记录类型
@property (nonatomic,copy) NSString *type;  // 打卡类型
@property (nonatomic,copy) NSString *tname; // 打卡类型名称
@property (nonatomic,copy) NSString *gid;   // 签到类型 1=上班打卡 2=下班打卡
@property (nonatomic,copy) NSString *gname; // 签到类型名称
@property (nonatomic,copy) NSString *signtime;// 签到时间戳
@property (nonatomic,copy) NSString *address;// 定位地址	[ LBS地图签到类型有效 ]
@property (nonatomic,copy) NSString *lng;// 定位经度	[ LBS地图签到类型有效 ]
@property (nonatomic,copy) NSString *lat;// 定位纬度	[ LBS地图签到类型有效 ]

@end
