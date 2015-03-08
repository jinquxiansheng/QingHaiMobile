//
//  DataManager.h
//  AuthDemo
//
//  Created by yao on 14-8-3.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LoginUserModel;

@interface DataManager : NSObject
+(DataManager *)shareManager;
- (void)createDatabase;


- (BOOL)saveTestData:(id)object;
- (NSString *)selectQuery:(NSDate **)date;

- (BOOL)saveEmployeeWithID:(NSString *)Id  pwd:(NSString *)pwd rememberPwd:(NSString *)remSign;
- (LoginUserModel *)selectLoginInfo;
- (LoginUserModel *)selectPwdWithID:(NSString *)Id;
- (BOOL)deletePwdWithId:(NSString *)Id;


@end

