//
//  MoreViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "MoreViewController.h"
#import "GlobalCellTableViewCell.h"
@interface MoreViewController ()
{
    NSArray   *_tipArray;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tipArray = @[@"打开声音",@"上班打卡提醒",@"下班打卡提醒",@"填写日志提醒"];
    [self customNavigationHeadTitle:@"更多"];
    self.cellHeight = 50;

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:NO];
    
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.cellHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tipArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"GlobalCellTableViewCell";
    GlobalCellTableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[GlobalCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.cellHeight = 50;
        //        //        cell.backgroundColor = [UIColor clearColor];
        //        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"TestTableViewCell" owner:nil options:nil];
        //        cell = [nibs lastObject];
        //        cell.backgroundColor = [UIColor clearColor];
        UISwitch *switchs = [[UISwitch alloc] initWithFrame:CGRectZero];
        [cell.contentView addSubview:switchs];
        [switchs addPaddingConstraintsWithSuperView:cell.contentView top:10 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:10];
    }
    cell.textLabel.text = _tipArray [indexPath.row] ;
    return cell;
}


@end
