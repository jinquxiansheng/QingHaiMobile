//
//  SearchDateView.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SearchDateView.h"
#import "CustomDateTextField.h"
const static CGFloat labelWidth = 40;

@interface SearchDateView()
@property (nonatomic,strong) UIDatePicker           *datePicker;

@end
@implementation SearchDateView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    //cmcc.fengcms.com
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *startLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, self.height)];
        startLab.text = @"开始日期";
        startLab.numberOfLines = 0;
        startLab.backgroundColor = [UIColor yellowColor];
        [self addSubview:startLab];
        

        UILabel *endLab = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 90, 0, labelWidth, self.height)];
        endLab.text = @"结束日期";
        endLab.numberOfLines = 0;
        endLab.backgroundColor = [UIColor yellowColor];
        [self addSubview:endLab];
      
        
//        _datePicker = [[UIDatePicker alloc] init];
//        _datePicker.backgroundColor = [UIColor whiteColor];
//        UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
//        tools.backgroundColor = [UIColor redColor];
//        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"") style:UIBarButtonItemStyleDone target:self action:@selector(handleActionBarDone:)];
//        UIBarButtonItem *leftflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//        [tools setItems:[NSArray arrayWithObjects:leftflexible,doneButton, nil]];
//        UITextField *startTextView = [[UITextField alloc] initWithFrame:CGRectMake(startLab.left + startLab.width, 0, 100, self.height)];
//        [self addSubview:startTextView];
//        // [texts becomeFirstResponder];
//        startTextView.backgroundColor = [UIColor greenColor];
//        startTextView.inputView = _datePicker;
//        startTextView.inputAccessoryView = tools;
        
        CustomDateTextField *dateView = [[CustomDateTextField alloc] initWithFrame:CGRectMake(startLab.left + startLab.width, 0, 100, self.height)];
        [self addSubview:dateView];
        

    }
    return self;
}
- (void)handleActionBarDone:(id)sender
{
    [self endEditing:YES];
    
}

@end
