//
//  LikeViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "AccountViewController.h"
#import "Test2ViewController.h"
#import "QHMainViewController.h"
@interface AccountViewController ()

@end

@implementation AccountViewController

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
    [self customNavigationHeadTitle:@"账户信息"];
    [self customNavigationBack:@"dading" normalImage:@"like" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:YES];
    
    
}
- (void)navigationDone:(id)sender
{
    [self.navigationController pushViewController:[[Test2ViewController alloc] initWithNibName:@"Test2ViewController" bundle:nil] animated:YES];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
