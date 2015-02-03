//
//  SortViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "CheckWorkAttention.h"

@interface CheckWorkAttention ()

@end

@implementation CheckWorkAttention

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"考勤管理"];
    [self customNavigationBack:@"dading" normalImage:@"sort" highlightImage:@""];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:YES];
     
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
