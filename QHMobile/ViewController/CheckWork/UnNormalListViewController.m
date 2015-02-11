//
//  UnNormalListViewController.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "UnNormalListViewController.h"
#import "SearchDateView.h"
#import "RestRecordViewCell.h"
#import "UnNormalApplicationViewController.h"
@interface UnNormalListViewController ()

@end

@implementation UnNormalListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"异常记录"];
    [self customNavigationDone:@"" normalImage:@"add" highlightImage:@"add_on"];
    self.navigationController.navigationBarHidden = NO;
    
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
- (void)navigationDone:(id)sender
{
    //加班申请
    UnNormalApplicationViewController *unNormalCtrl = [[UnNormalApplicationViewController alloc] initWithNibName:@"UnNormalApplicationViewController" bundle:nil];
    [self.navigationController pushViewController:unNormalCtrl animated:YES];
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
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"RestRecordViewCell";
    RestRecordViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    //cell的高度是动态变化的
    if (cell == nil)
    {
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"RestRecordViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    cell.title.text = @"设备问题";
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
