//
//  QHMLoginViewController.m
//  QHMobile
//
//  Created by yao on 15/2/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMLoginViewController.h"
#import "QHMainViewController.h"
#import "QHRegisterViewController.h"
#import "NavBaseViewController.h"
@interface QHMLoginViewController ()
- (IBAction)LoginAction:(id)sender;
- (IBAction)register:(id)sender;

@end

@implementation QHMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithHex:0xFF004da3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore hiddenLoginNav:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)LoginAction:(id)sender {
    QHMainViewController *qhCtrl = [[QHMainViewController alloc] initWithNibName:@"QHMLoginViewController" bundle:nil];
    [self presentViewController:qhCtrl animated:YES completion:nil];
    
}

- (IBAction)register:(id)sender {
    QHRegisterViewController *registerCtrl = [[QHRegisterViewController alloc] initWithNibName:@"QHRegisterViewController" bundle:nil];
    
    [theUICore.loginNav pushViewController:registerCtrl animated:YES];
    
}
@end
