//
//  PersonDetailViewController.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "PersonDetailViewController.h"

@interface PersonDetailViewController ()

{
    NSArray   *_personDetailArray ;
}
@end

@implementation PersonDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _personDetailArray = @[@"姓名:",@"手机号:",@"邮箱:",@"部门:",@"工号"];
    [self customNavigationHeadTitle:@"个人信息"];
    [self customNavigationBack:@"dading" normalImage:@"like" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
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
    return 50;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _personDetailArray.count;
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
    cell.textLabel.text = _personDetailArray [indexPath.row] ;
    return cell;
}
@end
