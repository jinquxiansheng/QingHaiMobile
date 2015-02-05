//
//  ShopViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "FirstPageViewController.h"

@interface FirstPageViewController ()
@property (weak, nonatomic) IBOutlet UIView *managerView;
@property (weak, nonatomic) IBOutlet UIView *onWorkView;
@property (weak, nonatomic) IBOutlet UIView *offWorkView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *v1;

@end

@implementation FirstPageViewController

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
     [self customNavigationHeadTitle:@"考勤管理系统"];
     [self customNavigationBack:@"dading" normalImage:@"购物车" highlightImage:@""];
    
    //签到 签退视图
    self.managerView.width = SCREENWIDTH;
    self.onWorkView.width = self.managerView.width / 2;
    self.offWorkView.width = self.managerView.width / 2;
    self.offWorkView.left = self.managerView.width / 2;

   
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
