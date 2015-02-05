//
//  SimCardInsertViewController.m
//  QHMobile
//
//  Created by yao on 15/2/5.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SimCardInsertViewController.h"

@interface SimCardInsertViewController ()
@property (weak, nonatomic) IBOutlet UIButton *commit;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

@end

@implementation SimCardInsertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"账户信息"];
    [self customNavigationBack:@"dading" normalImage:@"like" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
    
    [self.commit setBackgroundImage:[[UIImage imageNamed:@"submit"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) ] forState:UIControlStateNormal];
    [self.commit setBackgroundImage:[[UIImage imageNamed:@"submit_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,2,2,2) ] forState:UIControlStateHighlighted];
    
    [self.cancel setBackgroundImage:[[UIImage imageNamed:@"cancel"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) ] forState:UIControlStateNormal];
    [self.cancel setBackgroundImage:[[UIImage imageNamed:@"cancel_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,2,2,2) ] forState:UIControlStateHighlighted];

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
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BrandTableViewCell";
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        
    }
    cell.textLabel.text = @"收入数量";
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
