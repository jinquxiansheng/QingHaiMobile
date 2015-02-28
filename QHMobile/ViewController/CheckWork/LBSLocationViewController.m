//
//  LBSLocationViewController.m
//  QHMobile
//
//  Created by yao on 15/2/9.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "LBSLocationViewController.h"
#define kLocationSuccessTag             1
#define kLocationFailedTag              2
#define kCheckInSuccessTag              3
#define kCheckInFailedTag               4
@interface LBSLocationViewController ()
{
    CGFloat   _lat;
    CGFloat   _long;
    NSString  *_address;
    
}
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;

- (IBAction)startLocation:(id)sender;

@end

@implementation LBSLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"LBS定位"];
    _locService = [[BMKLocationService alloc]init];
    _geocodesearch = [[BMKGeoCodeSearch alloc]init];
    [self.locationBtn.layer setCornerRadius:5];
    [self.locationBtn setBackgroundImage:[UIImage getMiddleStretchableImage:@"dingwei"] forState:UIControlStateNormal];
     [self.locationBtn setBackgroundImage:[UIImage getMiddleStretchableImage:@"dingwei_on"] forState:UIControlStateNormal];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:NO];
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
    _locService.delegate = self;
    _geocodesearch.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放

}
-(void)viewWillDisappear:(BOOL)animated {
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    _locService.delegate = nil;
    _geocodesearch.delegate = nil; // 不用时，置nil
    
}
//根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)view viewForAnnotation:(id <BMKAnnotation>)annotation
{
    NSString *AnnotationViewID = @"annotationViewID";
    //根据指定标识查找一个可被复用的标注View，一般在delegate中使用，用此函数来代替新申请一个View
    BMKAnnotationView *annotationView = [view dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
        ((BMKPinAnnotationView*)annotationView).pinColor = BMKPinAnnotationColorRed;
        ((BMKPinAnnotationView*)annotationView).animatesDrop = YES;
    }
    
    annotationView.centerOffset = CGPointMake(0, -(annotationView.frame.size.height * 0.5));
    annotationView.annotation = annotation;
    annotationView.canShowCallout = TRUE;
    return annotationView;
}
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        NSString* titleStr;
        NSString* showmeg;
        
        titleStr = @"正向地理编码";
        showmeg = [NSString stringWithFormat:@"经度:%f,纬度:%f",item.coordinate.latitude,item.coordinate.longitude];
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
        [myAlertView show];
    }
}
#pragma mark -经纬度解析成功
-(void) onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSArray* array = [NSArray arrayWithArray:_mapView.annotations];
    [_mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:_mapView.overlays];
    [_mapView removeOverlays:array];
    if (error == 0) {
        BMKPointAnnotation* item = [[BMKPointAnnotation alloc]init];
        item.coordinate = result.location;
        item.title = result.address;
        [_mapView addAnnotation:item];
        _mapView.centerCoordinate = result.location;
        [self showAlertViewWithTag:kLocationSuccessTag message:item.title];
    }
}
#pragma mark -根据定位信息，弹出提示框提示
- (void)showAlertViewWithTag:(NSInteger)tag message:(NSString *)message
{
    NSString* titleStr;
    NSString* showMsg;
    titleStr = @"提示";
    if (tag == kLocationSuccessTag)
        showMsg = [NSString stringWithFormat:@"您的位置:%@",message];
    else
        showMsg = message;
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showMsg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
    myAlertView.tag = tag;
    [myAlertView show];
}
#pragma mark - AlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    //点击确认以后开始签到，调用接口
//    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
//    
//    selfCallBack.doneBlock = ^(id result,NSUInteger tag)
//    {
//        //        NoNetView *noView =(NoNetView *) [bself.view viewWithTag:kViewTag];
//        //        [noView hide];
//        //        bself.brandArray = result;
//        //        [bself reloadView];
//        // [weakSelf.baseTableView headerEndRefreshing];
//        NSString *info = [result objectForKey:@"info"];
//        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"t" message:info delegate:nil cancelButtonTitle:@"ce" otherButtonTitles:nil, nil];
//        //        [alert show];
//        NSLog(@"%@",info);
//    };
//    selfCallBack.failedBlock = ^(NSError *error)
//    {
//        if (error.NetState == ErrorNoNet)
//        {
//            //            NoNetView *noView = [[NoNetView alloc] initWithSelect:@selector(refreshView) withTarget:bself targetView:bself.view];
//            //            noView.tag = kViewTag;
//            //            [noView showInView:bself.view];
//        }
//    };
//    [MANAGER checkinWithLng:@"102.112239" lat:@"36.504831" gid:@"1" address:@"青海省海东地区平安县平安路122" callBack:selfCallBack];

}

//停止定位
-(IBAction)stopLocation:(id)sender
{
    [_locService stopUserLocationService];
    _mapView.showsUserLocation = NO;

}

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
    NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    //这里的逻辑应该是签到成功，带服务器返回成功的标志以后，才能将签到按钮隐藏
    [_mapView updateLocationData:userLocation];
    [self stopLocation:nil];
    //开始解析经纬度，返回具体的位置
    CLLocationCoordinate2D pt = (CLLocationCoordinate2D){0, 0};
    pt = (CLLocationCoordinate2D){userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude};
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = pt;
//    BOOL flag = [_geocodesearch reverseGeoCode:reverseGeocodeSearchOption];
//    if(flag)
//    {
//        NSLog(@"反geo检索发送成功");
//    }
//    else
//    {
//        NSLog(@"反geo检索发送失败");
//    }
    
    
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}
#pragma mark --定位失败后，会调用此函数
/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    [self stopLocation:nil];
    [self showAlertViewWithTag:kLocationFailedTag message:@"定位信息出问题,请检查网络是否正常"];


}


//- (void)dealloc {
//    if (_mapView) {
//        _mapView = nil;
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)startLocation:(id)sender {
    
    NSLog(@"进入普通定位态");
    [_locService startUserLocationService];
//    _mapView.showsUserLocation = NO;//先关闭显示的定位图层
//    _mapView.userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
//    _mapView.showsUserLocation = YES;//显示定位图层
    
}
@end
