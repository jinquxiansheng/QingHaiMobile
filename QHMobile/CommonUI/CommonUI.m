//
//  CommonUI.m
//  QHMobile
//
//  Created by yao on 14-8-26.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "CommonUI.h"
#import "QHMainViewController.h"
#import "NoNetView.h"
static    CommonUI   *manager = nil;
@implementation CommonUI

+(CommonUI *)shareManager
{
    static dispatch_once_t token;
    dispatch_once(&token,^{
        manager = [[CommonUI alloc] init];
    } );
    return manager;
}
- (void)showBottomTab:(BOOL)visible
{
    
    QHMainViewController  *tabCtrl = (QHMainViewController *)self.mainViewController;
    tabCtrl.tabbarView.hidden = !visible ;
    
}
- (void)hiddenLoginNav:(BOOL)hideNav
{
    UINavigationController *nav = self.loginNav;
    nav.navigationBarHidden = hideNav;
}
- (UIView *)tabBarView
{
     QHMainViewController  *tabCtrl = (QHMainViewController *)self.mainViewController;
    return tabCtrl.tabbarView;
}
//- (void)showNoNetPageWithTag:(NSInteger)tag
//{
//    NoNetView *noView = [[NoNetView alloc] initWithSelect:@selector(refreshView) withTarget:self.viewController targetView:self.viewController.view];
//    noView.tag = kViewTag;
//    [noView showInView:self.viewController.view];
//}
@end
