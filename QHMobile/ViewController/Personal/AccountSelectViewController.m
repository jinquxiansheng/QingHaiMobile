//
//  AccountSelectViewController.m
//  QHMobile
//
//  Created by yao on 15/3/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "AccountSelectViewController.h"

@interface AccountSelectViewController ()<UIWebViewDelegate>

@end

@implementation AccountSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.webView.scalesPageToFit =YES;
//    self.webView.delegate =self;
//    NSURL *url =[NSURL URLWithString:@"http://cmcc.fengcms.com/manage/home/index"];
//    NSURLRequest *request =[NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
    [self customNavigationHeadTitle:self.title];

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
