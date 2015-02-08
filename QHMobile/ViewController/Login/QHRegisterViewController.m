//
//  QHRegisterViewController.m
//  QHMobile
//
//  Created by yao on 15/2/5.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHRegisterViewController.h"
#import "QHMainViewController.h"
#import "RegisterCell.h"
@interface QHRegisterViewController ()
{
    NSArray   *_registerArray;
}
- (IBAction)goRegister:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@end

@implementation QHRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"注册帐号"];
    [theUICore hiddenLoginNav:NO];
    _registerArray = @[@"手机号:",@"激活码:",@"密码:",@"确认密码"];
    //按钮背景设备
    [self.registerBtn setBackgroundImage:[[UIImage imageNamed:@"common_orange"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) ] forState:UIControlStateNormal];
    [self.registerBtn setBackgroundImage:[[UIImage imageNamed:@"common_orange_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5) ] forState:UIControlStateHighlighted];
    
    self.cellHeight = 60;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellHeight;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _registerArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"RegisterCell";
    RegisterCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[RegisterCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.cellHeight = self.cellHeight;
        [cell configCellContent:indexPath.row];
    }
    //

    cell.textLabel.text = _registerArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)goRegister:(id)sender {
    QHMainViewController *qhCtrl = [[QHMainViewController alloc] initWithNibName:@"QHMLoginViewController" bundle:nil];
    [self presentViewController:qhCtrl animated:YES completion:nil];
}
@end
