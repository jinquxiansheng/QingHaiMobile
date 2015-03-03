//
//  CashViewController.m
//  QHMobile
//
//  Created by yao on 15/3/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "CashViewController.h"
#import "AddCashViewController.h"
@interface CashViewController ()<UIWebViewDelegate>

@end

@implementation CashViewController

- (void)viewDidLoad {
    self.urlStr = @"http://cmcc.fengcms.com/financial/submited/lists/item/cash";
    [super viewDidLoad];
    [self customNavigationHeadTitle:@"现金台帐"];
    [self customNavigationDone:@"" normalImage:@"add" highlightImage:@"add_on"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)navigationDone:(id)sender
{
    AddCashViewController *addCtrl = [[AddCashViewController alloc] initWithNibName:@"AddCashViewController" bundle:nil];
    [self.navigationController pushViewController:addCtrl animated:YES];
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
