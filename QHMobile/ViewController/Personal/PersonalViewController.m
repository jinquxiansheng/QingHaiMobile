//
//  PersonalViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonDetailViewController.h"
#import "SettingViewController.h"
#import "PersonalViewCell.h"
#import "MoreViewController.h"
#import "AccountSelectViewController.h"
@interface PersonalViewController ()
{
    NSArray   *_personArray;
}
@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"个人信息"];
    _personArray = @[@"设置",@"更多",@"部门台帐查询",@"退出"];
    if (!iPhone4)
        self.baseTableView.scrollEnabled = NO;
    CGFloat bgHeight = SCREENWIDTH * 241 / 320;
    
    UIView *personInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, bgHeight)];
    personInfoView.backgroundColor = [UIColor clearColor];
    self.baseTableView.tableHeaderView = personInfoView ;
    
    UIImageView *bgImage = [[UIImageView alloc]init];
    bgImage.backgroundColor = [UIColor clearColor];
    [bgImage setImage:[UIImage imageNamed:@"my_new"]];
    [personInfoView addSubview:bgImage];
    [bgImage addPaddingConstraintsWithSuperView:personInfoView top:0 bottom:0 left:0 right:0];

    //头像
    CGFloat headWidth = 125;
    if (iPhone6Plus) {
        headWidth = 161;
    };
    if (iPhone6) {
        headWidth = 146;
    }
    UIImageView *personHeadView = [[UIImageView alloc] init];
    personHeadView.backgroundColor = [UIColor yellowColor];
    [personHeadView setImage:[UIImage imageNamed:@"key"]];
    [personInfoView addSubview:personHeadView];
    personHeadView.layer.masksToBounds = YES;
    personHeadView.layer.cornerRadius = headWidth / 2;
    [personHeadView addWHConstraintsWithSuperView:personInfoView width:headWidth height:headWidth];
    CGFloat top = 44;
    if (iPhone6Plus) {
        top = 55;
    }
    if (iPhone6) {
        top = 52;
    }
    [personHeadView addPaddingConstraintsWithSuperView:personInfoView top:top bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:CGFLOAT_CONSTRAINTS_INVALID];
    [personHeadView setEdge:personInfoView attr:NSLayoutAttributeCenterX constant:0];
    
    //名称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"ceshi";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [personInfoView addSubview:nameLabel];
    [nameLabel addWHConstraintsWithSuperView:personInfoView width:SCREENWIDTH height:40];
    [nameLabel addPaddingConstraintsWithSuperView:personInfoView top:CGFLOAT_CONSTRAINTS_INVALID bottom:CGFLOAT_CONSTRAINTS_INVALID left:1 right:CGFLOAT_CONSTRAINTS_INVALID];
    [personHeadView addPaddingConstraintsWithNextView:nameLabel superView:personInfoView verticalPadding:@"20" horizontalPadding:NSSTRING_CONSTRAINTS_INVALID];
    

    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:YES];
    
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
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return  100;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _personArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BrandTableViewCell";
    PersonalViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[PersonalViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.cellHeight = 50 ;
//        //        cell.backgroundColor = [UIColor clearColor];
//        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:nil options:nil];
//        cell = [nibs lastObject];
//        cell.backgroundColor = [UIColor clearColor];
        //[cell configCellContent:indexPath.row];
    }
//    if (indexPath.row == 0) {
//        cell.textLabel.text = @"分享到";
//    }
//    if (indexPath.row == 1) {
//        cell.textLabel.text = @"更多";
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    }
    cell.textLabel.text = _personArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        SettingViewController *setingCtrl = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
        [self.navigationController pushViewController:setingCtrl animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row == 1) {
        MoreViewController *moreCtrl = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
        [self.navigationController pushViewController:moreCtrl animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    if (indexPath.row == 2) {
        //部门台帐查询
        AccountSelectViewController *asCtrl = [[AccountSelectViewController alloc] initWithNibName:@"AccountSelectViewController" bundle:nil];
        [self.navigationController pushViewController:asCtrl animated:YES];
    }
    if (indexPath.row == 3) {
        //退出
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
}

- (void)goToPersonDetail:(id)sender
{
    PersonDetailViewController *detailCtrl = [[PersonDetailViewController alloc] initWithNibName:@"PersonDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailCtrl animated:YES];
}

//- (void)goToMore:(id)sender
//{
//   
//}

@end
