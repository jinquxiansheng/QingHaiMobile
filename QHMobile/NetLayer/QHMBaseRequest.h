//
//  QHMBaseRequest.h
//  QHMobile
//
//  Created by yao on 15/2/2.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import"AFNetworking.h"
#import "InteralCache.h"
#import "JSONKit.h"
#import "QHMGlobal.h"
#import "GlobalUrl.h"
#import "MBProgressHUD.h"
typedef NS_ENUM(NSInteger, RequestType)
{
    Get,
    Post
};

@interface QHMBaseRequest :    NSObject<MBProgressHUDDelegate>

@property (nonatomic,copy)  NSString *url;
@property (nonatomic,assign)RequestType  requestType;
@property (nonatomic,copy)  NSString *errorCode;
@property (nonatomic,copy)  NSString *cookie;
@property (nonatomic,strong)AFHTTPRequestOperationManager *manager;
@property (nonatomic,assign)BOOL  needSaveCache;
@property (nonatomic,strong)NSDictionary  *resultDic;
@property (nonatomic,copy) NSString *info;
@property (nonatomic,copy) NSString *status;
@property (nonatomic,copy) NSString *loadingText;
@property (nonatomic,assign)BOOL needLoadView;
@property (nonatomic,strong)id target;

- (void)sendToServer:(HttpCallBack *)callback;
- (BOOL)addPostParameter:(NSString *)strName value:(NSString *)strValue;
- (BOOL)addGetParameter:(NSString *)strSection value:(NSString *)strValue;
- (void)cancelRequest;
- (void)setHttpManager;
- (void)saveCache:(id)object;
- (BOOL)cacheQuery;                 //读取缓存
- (BOOL)dataOverDue:(NSTimeInterval)interval date:(NSDate *)date;   //缓存过期时间

@end
