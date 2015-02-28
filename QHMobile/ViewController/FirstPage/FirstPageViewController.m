//
//  ShopViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "FirstPageViewController.h"
#import "LBSLocationViewController.h"
#import "QHMADScrollerView.h"
@interface FirstPageViewController ()<EScrollerViewDelegate>
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
@property (strong, nonatomic) IBOutlet UIButton *leftStepBtn;

@property (strong, nonatomic) IBOutlet UIButton *rightStepBtn;

@property (strong,nonatomic)  QHMADScrollerView *adScrollView;

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
- (void)loadView
{
    [super loadView];
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
    }
    //广告视图的高度 想办法
    CGFloat adViewHeight = 0;
    if (iPhone4)
        adViewHeight = self.scrollView.height - 145;
    else if (iPhone5)
        adViewHeight = self.scrollView.height - 60;
    else if (iPhone6)
        adViewHeight = self.scrollView.height + 35;
    else if (iPhone6Plus)
        adViewHeight = self.scrollView.height + 110;
    //广告
    _adScrollView = [[QHMADScrollerView alloc] initWithFrameRect:CGRectMake(0, 0, SCREENWIDTH, adViewHeight)
                                                                  ImageArray:
                                 [NSArray arrayWithObjects:@"nav_home.png",@"nav_my",@"nav_kaoqin", nil]
                                                                  TitleArray:nil];
    _adScrollView.delegate=self;
    _adScrollView.backgroundColor = [UIColor yellowColor];
    [self.scrollView addSubview:_adScrollView];
   
    
    //左边的button
    
    _leftStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftStepBtn.frame = CGRectMake(-1, 113, 40, 101);
    [_leftStepBtn setImage:[UIImage imageNamed:@"fouse_right"] forState:UIControlStateNormal];
    [_leftStepBtn setImage:[UIImage imageNamed:@"fouse_right_on"] forState:UIControlStateHighlighted];
    [self.scrollView addSubview:_leftStepBtn];

    //右边的button
    _rightStepBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightStepBtn.frame = CGRectMake(0, 113, 40, 101);
    [_rightStepBtn setImage:[UIImage imageNamed:@"fouse_right"] forState:UIControlStateNormal];
    [_rightStepBtn setImage:[UIImage imageNamed:@"fouse_right_on"] forState:UIControlStateHighlighted];
    [self.scrollView addSubview:_rightStepBtn];
    

    self.managerView.width = SCREENWIDTH;
    self.managerView.height = SCREENHEIGHT - self.scrollView.height - theUICore.tabBarView.height;
    self.managerView.top = self.scrollView.height;
    self.onWorkView.width = self.managerView.width / 2 - 1;
    self.offWorkView.width = self.managerView.width / 2;
    self.offWorkView.left = self.managerView.width / 2;
    self.onWorkBtn.width =  self.onWorkView.width;
    self.offWorkBtn.width =  self.offWorkView.width;
    self.onWorkLabel.width =  self.onWorkView.width;
    self.offWorkLabel.width = self.offWorkView.width;
    self.sepLine.left =  self.managerView.width / 2;
    self.sepLine.backgroundColor = [UIColor colorWithHex:0xFFE6E6E6];
    self.sepLine.height = self.managerView.height;
    self.onWorkLabel.textColor = [UIColor colorWithHex:0xFFa3a3a3];
    self.offWorkLabel.textColor = [UIColor colorWithHex:0xFFa3a3a3];
    self.rightStepBtn.right = SCREENWIDTH +1;
    
//    [self.leftStepBtn bringSubviewToFront:self.scrollView];
//    [self.rightStepBtn bringSubviewToFront:self.scrollView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"考勤管理系统"];
  //  [self customNavigationDone:@"" normalImage:@"caidan" highlightImage:@"caidan_on"];
    //签到 签退视图
  
    
    
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
    LBSLocationViewController *checkInCtrk = [[LBSLocationViewController alloc] initWithNibName:@"LBSLocationViewController" bundle:nil];
    [self.navigationController pushViewController:checkInCtrk animated:YES];
}
#pragma mark -ad delegate
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%d",index);
}

@end
