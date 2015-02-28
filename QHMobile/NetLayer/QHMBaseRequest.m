//
//  QHMBaseRequest.m
//  QHMobile
//
//  Created by yao on 15/2/2.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMBaseRequest.h"
#import "NSError+ErrorState.h"
@interface QHMBaseRequest()
{
    NSMutableDictionary *_dataModePost;
    NSMutableDictionary *_dataModeGet;
    __block MBProgressHUD   *_hud;
    
}
@end

@implementation QHMBaseRequest

- (id)init
{
    if (self) {
        _needLoadView = YES;
        _needSaveCache = NO;

    }
    return self;
}
//- (void)dealloc
//{
//    self.url = nil;
//    self.errorCode = nil;
//    self.cookie = nil;
//   // self.target = nil;
//    [self baseClear];
//    [super dealloc];
//}
- (void)saveCache:(id)object
{
    
}
- (BOOL)cacheQuery
{
    return false;
}
- (void)sendToServer:(HttpCallBack *)callback;
{
    __block QHMBaseRequest   *bself = self;
      __block UIViewController *viewController = (UIViewController *)self.target;
    // [MBProgressHUD showHUDAddedTo:viewController.view animated:YES];
    if (_needLoadView) {
        _hud = [[MBProgressHUD alloc] initWithView:viewController.view];
        _hud.delegate = self;
        [viewController.view addSubview:_hud];
        _hud.labelText = _loadingText;
        [_hud show:YES];

    }
 
    //AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    self.manager.responseSerializer.acceptableContentTypes =[NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"application/json", nil];
    self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if (self.cookie.length > 0 && self.cookie) {
        [self.manager.requestSerializer setValue:self.cookie forHTTPHeaderField:@"Cookie"];
        
    }
    self.manager.requestSerializer.timeoutInterval = REQUESTTIMEINTERVALOUT;
    if ([self cacheQuery]) {
        //读缓存
        self.needSaveCache = FALSE;
        callback.doneBlock(self.resultDic ,1);
        [self baseClear];
        return;
    }
    else
    {
        if (self.requestType == Get )
        {
            [self.manager GET:self.url parameters:_dataModeGet success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [_hud hide:YES];
                [bself handleSuccesWithObject:responseObject callBack:callback];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [bself handleFaildWithError:error callBack:callback];
            }];
        }
        else
        {
            [self.manager POST:self.url parameters:_dataModePost success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 [_hud hide:YES];
                [self handleSuccesWithObject:responseObject callBack:callback];
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 
                 [bself handleFaildWithError:error callBack:callback];
               
             }];
        }
    }
}
- (void)cancelRequest
{
    [self baseClear];
    
}
- (void)setHttpManager
{
    self.manager = [AFHTTPRequestOperationManager manager];
    
}
- (void)setUrl:(NSString *)url
{
   NSString *rUrl = [[GlobalUrl shareManager] configUrl:url];
    _url = rUrl;
}
//- (NSString *)url
//{
//    return self.url;
//}
#pragma mark - 方法
#pragma mark -添加GET参数
- (BOOL)addGetParameter:(NSString *)strSection value:(NSString *)strValue
{
    if( !_dataModeGet )
    {
        _dataModeGet = [[NSMutableDictionary alloc]init];
    }
    if( !strSection || 0 == strSection.length )
    {
        return FALSE;
    }
    if( !strValue )
    {
        // strValue = @"";
        return FALSE;
    }
    [_dataModeGet setObject:strValue forKey:strSection];
    return TRUE;
    
}
#pragma mark -添加POST参数
- (BOOL)addPostParameter:(NSString *)strName value:(NSString *)strValue
{
    if( !strName || 0 == strName.length )
    {
        return FALSE;
    }
    if( !strValue )
    {
        //strValue = @"";
        return FALSE;
    }
    
    if( !_dataModePost )
    {
        _dataModePost = [[NSMutableDictionary alloc]init];
    }
    [_dataModePost setObject:strValue forKey:strName];
    return TRUE;
}
- (void)baseClear
{
//    if( _url )
//    {
//        [_url release];
//        _url = nil;
//    }
//    if( _dataModeGet )
//    {
//        [_dataModeGet removeAllObjects];
//        [_dataModeGet release];
//        _dataModeGet = nil;
//    }
//    if( _dataModePost )
//    {
//        [_dataModePost removeAllObjects];
//        [_dataModePost release];
//        _dataModePost = nil;
//    }
//    if (self.manager) {
//        self.manager = nil;
//    }
//    if (self.resultDic) {
//        self.resultDic = nil;
//    }
//    if (_info) {
//        self.info = nil;
//
//    }
//    if (_status) {
//        self.status = nil;
//    }
}
- (BOOL)dataOverDue:(NSTimeInterval)interval date:(NSDate *)date
{
    if( nil == date )
    {
        return TRUE;
    }
    NSDate *dateNow = [NSDate date];
    NSTimeInterval timePass = [dateNow timeIntervalSinceDate:date];
    if( timePass >= interval )
    {
        return TRUE;
    }
    return FALSE;
    
}
- (void)handleSuccesWithObject:(id)responseObject callBack:(HttpCallBack *)callback
{
   
//    NSDictionary *info = [responseObject objectForKey:@"info"];
//    self.resultDic = info;
//    self.info = [responseObject objectForKey:@"info"];
//    self.status = [responseObject objectForKey:<#(id)#>];
    NSString *receiveStr =  [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSDictionary *receiveData = [receiveStr objectFromJSONString];
    callback.doneBlock (receiveData,1);
     [self baseClear];
}

- (void)handleFaildWithError:(NSError *)error callBack:(HttpCallBack *)callback
{
    [_hud hide:YES];
    NSString *errorMsg = nil;
    switch (error.code) {
        case ERRORCODEWITHOFFLINE:
        {
            errorMsg = ERRORMSGOFFLINE;
            error.NetState = ErrorNoNet;
            break;
        }
        case ERRORCODEWITHTIMEOUT:
        {
            errorMsg = ERRORMSGTIMEOUT;
            error.NetState = ErrorOverTime;
            break;
        }
        case ERRORCODEWITHCANCEL:
            errorMsg = ERRORMSGCANCEL;
            break;
        default:
            break;
    }
    error.errorMsg = errorMsg;
    callback.failedBlock (error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:error.errorMsg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    [alert show];

    [self baseClear];
}
#pragma mark -- MBProgress Delegaet
- (void)hudWasHidden:(MBProgressHUD *)hud
{
    // Remove HUD from screen when the HUD was hidded
    [_hud removeFromSuperview];
    
}
@end
