//
//  MoreViewController.m
//  QHMobile
//
//  Created by yao on 15/2/9.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "MoreViewController.h"
#import "GlobalCellTableViewCell.h"
@interface MoreViewController ()
{
    NSArray *_tipArray;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customNavigationHeadTitle:@"更多"];

    // Do any additional setup after loading the view from its nib.
    _tipArray = @[@"版本检测",@"清除缓存",@"关于我们",@"意见反馈"];
    self.cellHeight = 50;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:NO];
    
}
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
        cell.cellHeight = self.cellHeight;
    }
    cell.textLabel.text = _tipArray [indexPath.row] ;
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
