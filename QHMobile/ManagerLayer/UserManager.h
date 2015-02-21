//
//  UserManager.h
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TestManager;
@interface UserManager : NSObject
+(UserManager *)shareManager;
//测试接口，请求和取消
- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
- (void)accessCancel:(NSString *)requestName;
//

//登录接口
- (void)loginWithPhone:(NSString *)phone
                   pwd:(NSString *)pwd
              callBack:(HttpCallBack *)callback
                target:(id)target;

//lbs地图签到
- (void)checkinWithLng:(NSString *)lng
                   lat:(NSString *)lat
                   gid:(NSString *)gid
               address:(NSString *)address
            callBack:(HttpCallBack *)callback;
//登录选择部门
- (void)selectDepartmentWithID:(NSString *)ID callBack:(HttpCallBack *)callback;
//考勤记录列表
- (void)checkListWithCallBack :(HttpCallBack *)callback;
- (void)checkListMoreWithCallBack:(HttpCallBack *)callback;
//获取考勤申请子类
- (void)checkWithType:(NSString *)type callBack:(HttpCallBack *)callback;
//实现考勤申请接口
- (void)workApplicationWithType:(NSString *)type
                          ctype:(NSString *)ctype
                         s_time:(NSString *)s_time
                         e_time:(NSString *)e_time
                         reason:(NSString *)reason
                       callBack:(HttpCallBack *)callback;
//考勤申请列表
- (void)applicationListWithType:(NSString *)type callBack:(HttpCallBack *)callback;
- (void)applicationListMoreWithType:(NSString *)type callBack:(HttpCallBack *)callback;
//获取可操作台账
- (void)accountListWithCallBack:(HttpCallBack *)callback;
//获取已经提交台账列表
- (void)submitApplicationListWithItem:(NSString *)item  callBack:(HttpCallBack *)callback;
- (void)submitApplicationListMoreWithItem:(NSString *)item  callBack:(HttpCallBack *)callback;

//个人信息获取
- (void)userAllInfoWithCallBack:(HttpCallBack *)callback;
@end
