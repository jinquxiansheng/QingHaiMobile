//
//  OnWorkListViewController.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "OnWorkListViewController.h"
#import "OnWorkCell.h"
#import "SearchDateView.h"
@interface OnWorkListViewController ()

@end

@implementation OnWorkListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"考勤记录"];
    SearchDateView *searchView = [[SearchDateView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    searchView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:searchView];

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
    return 190;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"OnWorkCell";
    OnWorkCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    //cell的高度是动态变化的
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"OnWorkCell" owner:nil options:nil];
        cell = [nibs lastObject];
        cell.cellHeight = 158;
    }
    return cell;
}

@end
