//
//  PersonalViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonDetailViewController.h"
#import "MoreViewController.h"
@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"个人信息"];
    [self customNavigationBack:@"dading" normalImage:@"like" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
    
    UIView *personInfoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 200)];
  // [personInfoView addPaddingConstraintsWithSuperView:self.baseTableView.tableHeaderView top:0 bottom:0 left:0 right:9];
    personInfoView.backgroundColor = [UIColor lightGrayColor];
    self.baseTableView.tableHeaderView = personInfoView ;
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToMore:)];
//    [personInfoView addGestureRecognizer:tap];
    
    //头像
    UIView *personHeadView = [[UIView alloc] init];
    personHeadView.backgroundColor = [UIColor yellowColor];
    [personInfoView addSubview:personHeadView];
    [personHeadView addWHConstraintsWithSuperView:personInfoView width:120 height:120];
    [personHeadView addPaddingConstraintsWithSuperView:personInfoView top:20 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:CGFLOAT_CONSTRAINTS_INVALID];
    [personHeadView setEdge:personInfoView attr:NSLayoutAttributeCenterX constant:0];
    
    //名称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"ceshi";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    [personInfoView addSubview:nameLabel];
    [nameLabel addWHConstraintsWithSuperView:personInfoView width:SCREENWIDTH height:40];
    [nameLabel addPaddingConstraintsWithSuperView:personInfoView top:140 bottom:CGFLOAT_CONSTRAINTS_INVALID left:0 right:CGFLOAT_CONSTRAINTS_INVALID];
    
    
    //设置
    UIButton *setingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [setingBtn setTitle:@"设置" forState:UIControlStateNormal];
    setingBtn.backgroundColor = [UIColor greenColor];
    setingBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [personInfoView addSubview:setingBtn];
    [setingBtn addTarget:self action:@selector(goToPersonDetail:) forControlEvents:UIControlEventTouchUpInside];
    [setingBtn addWHConstraintsWithSuperView:personInfoView width:35 height:35];
    [setingBtn addPaddingConstraintsWithSuperView:personInfoView top:10 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:10];
    
    
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
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BrandTableViewCell";
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
//        //        cell.backgroundColor = [UIColor clearColor];
//        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:nil options:nil];
//        cell = [nibs lastObject];
//        cell.backgroundColor = [UIColor clearColor];
        
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"分享到";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"更多";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
   
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        MoreViewController *moreCtrl = [[MoreViewController alloc] initWithNibName:@"MoreViewController" bundle:nil];
        [self.navigationController pushViewController:moreCtrl animated:YES];
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
