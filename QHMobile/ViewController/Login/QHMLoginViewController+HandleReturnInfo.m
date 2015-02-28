//
//  QHMLoginViewController+HandleReturnInfo.m
//  QHMobile
//
//  Created by yao on 15/2/25.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMLoginViewController+HandleReturnInfo.h"
#import "QHMainViewController.h"

@implementation QHMLoginViewController (HandleReturnInfo)
- (void)handleResultWithStastu:(NSString *)status
{
    if ([status isEqualToString:@"1"])
    {
        QHMainViewController *qhCtrl = [[QHMainViewController alloc] initWithNibName:@"QHMLoginViewController" bundle:nil];
        [self presentViewController:qhCtrl animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"帐号或者密码错误,请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }

}
@end
