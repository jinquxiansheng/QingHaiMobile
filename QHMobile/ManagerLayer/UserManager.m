//
//  UserManager.m
//  AuthDemo
//
//  Created by yao on 14-8-1.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "UserManager.h"
#import "TestManager.h"
#import "LoginRequest.h"
#import "LbsCheckRequest.h"
#import "SelectDepartmentRequest.h"
#import "CheckListRequest.h"
#import "CheckTypeRequest.h"
#import "WorkApplicatoin.h"
#import "ApplicationListRequest.h"
#import "AccountListRequest.h"
#import "SubmitAccountListRequest.h"
#import "UserInfoRequest.h"
static  UserManager     *manager = nil;
@implementation UserManager
+(UserManager *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{ manager = [[UserManager alloc] init];} );
    return manager;
}

- (void)accessCancel:(NSString *)requestName
{
    if (NSClassFromString(requestName)) {
        [[NSClassFromString(requestName) shareManager] accessCancel:requestName];
    }
}


//以下修改
- (void)accessTokenWithCode:(NSString *)code  callBack:(HttpCallBack *)callback;
{
    
    [[TestManager shareManager] accessTokenWithCode:code callBack:callback];
}

//移动登录
- (void)loginWithPhone:(NSString *)phone
                   pwd:(NSString *)pwd
              callBack:(HttpCallBack *)callback
                target:(id)target
{
    [[LoginRequest shareManager] loginWithName:phone pwd:pwd callBack:callback target:target];
}
//lbs签到
- (void)checkinWithLng:(NSString *)lng
                   lat:(NSString *)lat
                   gid:(NSString *)gid
               address:(NSString *)address
              callBack:(HttpCallBack *)callback;
{
    [[LbsCheckRequest  shareManager] checkinWithLng:lng lat:lat gid:gid address:address callBack:callback];
}

//登陆/选择部门
- (void)selectDepartmentWithID:(NSString *)ID callBack:(HttpCallBack *)callback
{
    [[SelectDepartmentRequest shareManager] selectDepartmentWithID:ID callBack:callback];
}

- (void)checkListWithCallBack :(HttpCallBack *)callback
{
    [[CheckListRequest shareManager] checkListWithPage:@"1" callBack:callback];
}
- (void)checkListMoreWithCallBack:(HttpCallBack *)callback
{
    [[CheckListRequest shareManager] checkListMoreWithPage:@"more" callBack:callback];
}
//获取考勤申请子类
- (void)checkWithType:(NSString *)type callBack:(HttpCallBack *)callback
{
    [[CheckTypeRequest shareManager] checkWithType:type callBack:callback];
}
- (void)workApplicationWithType:(NSString *)type
                          ctype:(NSString *)ctype
                         s_time:(NSString *)s_time
                         e_time:(NSString *)e_time
                         reason:(NSString *)reason
                       callBack:(HttpCallBack *)callback
{
    [[WorkApplicatoin shareManager] workApplicationWithType:type
                                                      ctype:ctype
                                                     s_time:s_time
                                                     e_time:e_time
                                                     reason:reason
                                                   callBack:callback];
}
//考勤申请列表
- (void)applicationListWithType:(NSString *)type callBack:(HttpCallBack *)callback
{
    [[ApplicationListRequest shareManager] applicationListWithType:type callBack:callback];
}
- (void)applicationListMoreWithType:(NSString *)type callBack:(HttpCallBack *)callback
{
    [[ApplicationListRequest shareManager] applicationListMoreWithType:type callBack:callback];
}
//获取可操作台账

- (void)accountListWithCallBack:(HttpCallBack *)callback
{
    [[AccountListRequest shareManager] accountListWithCallBack:callback];
}
//获取已经提交台账列表

- (void)submitApplicationListWithItem:(NSString *)item  callBack:(HttpCallBack *)callback
{
    [[SubmitAccountListRequest shareManager] submitApplicationListWithItem:item callBack:callback];
}
- (void)submitApplicationListMoreWithItem:(NSString *)item  callBack:(HttpCallBack *)callback
{
    [[SubmitAccountListRequest shareManager] submitApplicationListMoreWithItem:item callBack:callback];
}
//个人信息获取
- (void)userAllInfoWithCallBack:(HttpCallBack *)callback
{
    [[UserInfoRequest shareManager]  userAllInfoWithCallBack:callback];
}

@end
