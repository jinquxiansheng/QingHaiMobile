//
//  LBSLocationViewController.h
//  QHMobile
//
//  Created by yao on 15/2/9.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SecondViewController.h"
#import "BMapKit.h"

@interface LBSLocationViewController : SecondViewController<BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>
{
    IBOutlet BMKMapView* _mapView;
    BMKLocationService* _locService;
    BMKGeoCodeSearch* _geocodesearch;
}

@end
