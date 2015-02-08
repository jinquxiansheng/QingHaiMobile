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
@property (weak, nonatomic) IBOutlet UIButton *onWorkBtn;
@property (weak, nonatomic) IBOutlet UIButton *offWorkBtn;

@property (weak, nonatomic) IBOutlet UILabel *onWorkLabel;
@property (weak, nonatomic) IBOutlet UILabel *offWorkLabel;
@property (weak, nonatomic) IBOutlet UIView *sepLine;
@property (weak, nonatomic) IBOutlet UIButton *leftStepBtn;

@property (weak, nonatomic) IBOutlet UIButton *rightStepBtn;

- (IBAction)offWorkAction:(id)sender;
- (IBAction)onWorkAction:(id)sender;

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
    [self customNavigationDone:@"" normalImage:@"caidan" highlightImage:@"caidan_on"];
    //签到 签退视图
    if (iPhone4) {
        CGFloat movePadding = 48;
        self.scrollView.height += movePadding;
        self.managerView.top += movePadding;
        self.managerView.height -= movePadding;
        self. onWorkView.height -=movePadding;
        self.offWorkView.height -=movePadding;
        CGFloat imgTopInset = -40;
        [self.onWorkBtn setImageEdgeInsets:UIEdgeInsetsMake(imgTopInset, 0, 0, 0)];
        [self.offWorkBtn setImageEdgeInsets:UIEdgeInsetsMake(imgTopInset, 0, 0, 0)];
        self.onWorkLabel.top += 20;;
        //self.managerView.backgroundColor = [UIColor yellowColor];
    }
    self.managerView.width = SCREENWIDTH;
    self.onWorkView.width = self.managerView.width / 2 - 1;
    self.offWorkView.width = self.managerView.width / 2;
    self.offWorkView.left = self.managerView.width / 2;
    self.onWorkBtn.width =  self.onWorkView.width;
    self.offWorkBtn.width =  self.offWorkView.width;
    self.onWorkLabel.width =  self.onWorkView.width;
    self.offWorkLabel.width = self.offWorkView.width;
    self.sepLine.left =  self.managerView.width / 2;
    self.sepLine.backgroundColor = [UIColor colorWithHex:0xFFE6E6E6];
    self.onWorkLabel.textColor = [UIColor colorWithHex:0xFFa3a3a3];
    self.offWorkLabel.textColor = [UIColor colorWithHex:0xFFa3a3a3];
    self.rightStepBtn.right = SCREENWIDTH +1;
    
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

- (IBAction)offWorkAction:(id)sender {
    
}

- (IBAction)onWorkAction:(id)sender {
}
@end
