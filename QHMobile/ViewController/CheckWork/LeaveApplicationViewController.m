//
//  LeaveApplicationViewController.m
//  QHMobile
//
//  Created by yao on 15/2/8.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "LeaveApplicationViewController.h"
#import "LeaveApplicationCell.h"
#import "KxMenu.h"
@interface LeaveApplicationViewController ()

{
    CGFloat _cellHeight;
    NSArray *_leaveApplicationArray;
    NSArray *menuItems;
    
}
@property (weak, nonatomic) IBOutlet UIButton *commit;
@property (weak, nonatomic) IBOutlet UIButton *cancel;
@property (strong,nonatomic) UIButton  *buttonType;
@property (nonatomic,strong) UIDatePicker           *datePicker;

@end

@implementation LeaveApplicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"请假申请"];
    
    [self.commit setBackgroundImage:[[UIImage imageNamed:@"submit"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) ] forState:UIControlStateNormal];
    [self.commit setBackgroundImage:[[UIImage imageNamed:@"submit_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,2,2,2) ] forState:UIControlStateHighlighted];
    
    [self.cancel setBackgroundImage:[[UIImage imageNamed:@"cancel"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2) ] forState:UIControlStateNormal];
    [self.cancel setBackgroundImage:[[UIImage imageNamed:@"cancel_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,2,2,2) ] forState:UIControlStateHighlighted];
    
    _leaveApplicationArray = @[@"事假",@"外出公干",@"出差",@"工伤",@"休假",@"病假",@"婚假",@"产假",@"丧假",@"年假",@"其他"];
    menuItems =
    @[
      
      [KxMenuItem menuItem:@"事假"
                     image:nil
                    target:nil
                    action:NULL],
      
      [KxMenuItem menuItem:@"外出公干"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"出差"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"工伤"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"休假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      
      [KxMenuItem menuItem:@"病假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"婚假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"产假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"丧假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"年假"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)],
      [KxMenuItem menuItem:@"其他"
                     image:nil
                    target:self
                    action:@selector(pushMenuItem:)]
      ];
    
    
    KxMenuItem *first = menuItems[0];
    first.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/255.0f alpha:1.0];
    first.alignment = NSTextAlignmentCenter;
    
//    [KxMenu showMenuInView:self.view
//                  fromRect:sender.frame
//                 menuItems:menuItems];
    
   

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
    _cellHeight = 50;
    if (indexPath.row == 1) {
        _cellHeight = 100;
    }
    self.cellHeight = _cellHeight ;
    return _cellHeight;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"LeaveApplicationCell";
    LeaveApplicationCell *cell   = [tableView dequeueReusableCellWithIdentifier:cellID];
    //cell的高度是动态变化的
    if (cell == nil)
    {
        cell = [[LeaveApplicationCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.delegate = self;
        if (indexPath.row == 2) {
            _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
            _datePicker.backgroundColor = [UIColor whiteColor];
            // 设置时区
            // [_datePicker setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
            // 设置当前显示时间
            //[_datePicker setDate:tempDate animated:YES];
            // 设置显示最大时间（此处为当前时间）
            //[_datePicker setMaximumDate:[NSDate date]];
            // 设置UIDatePicker的显示模式
            //    [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
            //    //_datePicker.hidden = YES;
            //    [self.view addSubview:_datePicker];
            //    // 当值发生改变的时候调用的方法
            //    // [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
            //
            UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
            UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"") style:UIBarButtonItemStyleDone target:self action:@selector(handleActionBarDone:)];
            UIBarButtonItem *leftflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            [tools setItems:[NSArray arrayWithObjects:leftflexible,doneButton, nil]];
            // _datePicker.inputAccessoryView = tools;
            //_datePicker.inputAccessoryView
            
            
            UITextView *texts = [[UITextView alloc] initWithFrame:CGRectMake(100, 0, 200, 50)];
            [cell.contentView addSubview:texts];
           // [texts becomeFirstResponder];
            texts.backgroundColor = [UIColor yellowColor];
            texts.inputView = _datePicker;
            texts.inputAccessoryView = tools;

        }
        [cell configCellContent:indexPath.row];
    }
    cell.cellHeight =  50 ;
    if (indexPath.row == 1) {
        cell.cellHeight = 100;
    }

    [cell layoutSubViewsOnCell:indexPath.row];
    return cell;
}
- (void)handleActionBarDone:(id)sender
{}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
//        [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//            _datePicker.frame = CGRectMake(0, 300, 320, 150);
//        } completion:^(BOOL finished) {
//            
//        }];
    }
}
- (void)selectType:(UIButton *)button
{
    self.buttonType = button;
    [KxMenu showMenuInView:self.view fromRect:CGRectMake(120, 0, 100, 20) menuItems: menuItems];
 
}
- (void) pushMenuItem:(id)sender
{
    KxMenuItem *item = (KxMenuItem *)sender;
    NSLog(@"%@",item.title);
    [self.buttonType setTitle:item.title forState:UIControlStateNormal];
}

@end
