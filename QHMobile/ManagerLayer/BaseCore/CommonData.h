//
//  CommonData.h
//  QHMobile
//
//  Created by yao on 14-8-29.
//  Copyright (c) 2014年 yao. All rights reserved.
//
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define         SCREENWIDTH                                 (NSInteger)[UIScreen mainScreen ].bounds.size.width
#define         SCREENHEIGHT                                 (NSInteger) [UIScreen mainScreen ].bounds.size.height

#define         REQUESTTIMEINTERVALOUT                       20         //网络请求超时时间
#define         ERRORCODEWITHOFFLINE                        -1009       //无网络状态
#define         ERRORCODEWITHTIMEOUT                        -1001       //请求超时
#define         ERRORCODEWITHCANCEL                         -999        //取消请求


#define         ERRORMSGOFFLINE                             @"当前网络不可用，请检查你的网络设置"
#define         ERRORMSGTIMEOUT                             @"网络请求超时"
#define         ERRORMSGCANCEL                              @"请求取消"

#define         kViewTag                                     350        //无网情况

#define         TESTDATAID                                  @"idtest"   //缓存

#define         CACHEOVERTIME                               10         //缓存过期时间

#define         WINDOW                                      [UIApplication sharedApplication].keyWindow
/*
 * ios6系统判断：
 */
#define IOS6 (([[[UIDevice currentDevice] systemVersion] floatValue] >=6.0)&&([[[UIDevice currentDevice] systemVersion] floatValue] <=7.0)? (YES):(NO))
/*
 * ios7系统判断：
 */
#define IOS7	( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
/*
 * ios8系统判断：
 */

#define IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))
/*
 * rgb颜色转换（16进制->10进制）
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


static  const  float  tabBarHeight = 44;