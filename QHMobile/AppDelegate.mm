//
//  AppDelegate.m
//  QHMobile
//
//  Created by yao on 14-8-25.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "AppDelegate.h"
#import "InteralCache.h"
#import "BaseCore.h"
#import "QHMLoginViewController.h"
#import "UncaughtExceptionHandler.h"
#import "BMapKit.h"
#import "IQKeyboardManager.h"
@interface AppDelegate()<BMKGeneralDelegate>
{
    BMKMapManager* _mapManager;
    BMKLocationService* _locService;


}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    application.statusBarOrientation = UIInterfaceOrientationPortrait;

    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];

    BOOL ret = [_mapManager start:@"X9jGwSnUpZqdjtvFbcMdK1Fs" generalDelegate:self];
    
    if (!ret) {
        NSLog(@"manager start failed!");
    }
   // [IQKeyBoardManager installKeyboardManager];
   // InstallUncaughtExceptionHandler();
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    //ios 7 导航栏和状态栏
    NSString *imageName = @"nav_bg.png";
    if (IOS6) {
        imageName = @"nav_bg_ios6.png";
    }
    //状态栏和导航栏一体
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];//黑体白字
    QHMLoginViewController *loginCtrl = [[QHMLoginViewController alloc] initWithNibName:@"QHMLoginViewController" bundle:nil];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginCtrl];
    self.window.rootViewController = loginNav;
    theUICore.loginNav = loginNav;
    
    [[BaseCore shareBaseCore] configBaseCoreInfo];
    if (![[InteralCache shareInteralCache] firstStart]) {
        NSLog(@"引导页");
    }
    return YES;
}
///**
// *在地图View将要启动定位时，会调用此函数
// *@param mapView 地图View
// */
//- (void)willStartLocatingUser
//{
//    NSLog(@"start locate");
//}
//
///**
// *用户方向更新后，会调用此函数
// *@param userLocation 新的用户位置
// */
//- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
//{
//    //[_mapView updateLocationData:userLocation];
//    NSLog(@"heading is %@",userLocation.heading);
//}
//
///**
// *用户位置更新后，会调用此函数
// *@param userLocation 新的用户位置
// */
//- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
//{
//    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
//   // [_mapView updateLocationData:userLocation];
//    //[self stopLocation:nil];
//     [_locService stopUserLocationService];
//    
//}
//
///**
// *在地图View停止定位后，会调用此函数
// *@param mapView 地图View
// */
//- (void)didStopLocatingUser
//{
//    NSLog(@"stop locate");
//}
//
///**
// *定位失败后，会调用此函数
// *@param mapView 地图View
// *@param error 错误号，参考CLError.h中定义的错误号
// */
//- (void)didFailToLocateUserWithError:(NSError *)error
//{
//    NSLog(@"location error");
//}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [BMKMapView willBackGround];

}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     [BMKMapView didForeGround];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
