//
//  RestRecordViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "RestRecordViewController.h"
#import "RestRecordViewCell.h"
@interface RestRecordViewController ()

@end

@implementation RestRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"请假记录"];
    [self customNavigationBack:@"dading" normalImage:@"sort" highlightImage:@""];
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
    return 210;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BrandTableViewCell";
    RestRecordViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    //cell的高度是动态变化的
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"RestRecordViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

@end
