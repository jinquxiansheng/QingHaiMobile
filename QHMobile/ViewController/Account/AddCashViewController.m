//
//  AddCashViewController.m
//  QHMobile
//
//  Created by yao on 15/3/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "AddCashViewController.h"

@interface AddCashViewController ()

@end

@implementation AddCashViewController

- (void)viewDidLoad {
    self.urlStr = @"http://cmcc.fengcms.com/financial/submited/dispatcher/item/cash";

    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"现金台帐"];

}

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

@end
