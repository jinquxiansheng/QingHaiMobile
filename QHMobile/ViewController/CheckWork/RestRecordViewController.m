//
//  RestRecordViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "RestRecordViewController.h"
#import "RestRecordViewCell.h"
#import "LeaveApplicationViewController.h"
#import "SearchDateView.h"
@interface RestRecordViewController ()

@property (nonatomic,strong)IBOutlet SearchDateView *searchView;
@end

@implementation RestRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"请假记录"];
    [self customNavigationDone:@"" normalImage:@"add" highlightImage:@"add_on"];
    self.navigationController.navigationBarHidden = NO;
    
    SearchDateView *searchView = [[SearchDateView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 50)];
    searchView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:searchView];
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
- (void)navigationDone:(id)sender
{
    //加班申请
    LeaveApplicationViewController *leaveCtrl = [[LeaveApplicationViewController alloc] initWithNibName:@"LeaveApplicationViewController" bundle:nil];
    [self.navigationController pushViewController:leaveCtrl animated:YES];
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
    return cell;
}

@end
