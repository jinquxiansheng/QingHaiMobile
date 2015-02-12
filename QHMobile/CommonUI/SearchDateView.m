//
//  SearchDateView.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "SearchDateView.h"
const static CGFloat labelWidth = 80;

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
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *startLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelWidth, 30)];
        startLab.text = @"开始日期";
        startLab.backgroundColor = [UIColor yellowColor];
        [self addSubview:startLab];
        
//        UILabel *testLab = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, labelWidth, 30)];
//        testLab.text = @"日期控件";
//        testLab.backgroundColor = [UIColor blueColor];
//        testLab.textColor = [UIColor whiteColor];
//        [self addSubview:testLab];

        UILabel *endLab = [[UILabel alloc] initWithFrame:CGRectMake(250, 0, labelWidth, 30)];
        endLab.text = @"结束日期";
        endLab.backgroundColor = [UIColor yellowColor];
        [self addSubview:endLab];
      
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 200, 150)];
        _datePicker.backgroundColor = [UIColor whiteColor];

        UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(50, 0, 200, 50)];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"") style:UIBarButtonItemStyleDone target:self action:@selector(handleActionBarDone:)];
        UIBarButtonItem *leftflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [tools setItems:[NSArray arrayWithObjects:leftflexible,doneButton, nil]];
        // _datePicker.inputAccessoryView = tools;
        //_datePicker.inputAccessoryView
        
        
        UITextView *texts = [[UITextView alloc] initWithFrame:CGRectMake(100, 0, 200, 50)];
        [self addSubview:texts];
        // [texts becomeFirstResponder];
        texts.backgroundColor = [UIColor yellowColor];
        texts.inputView = _datePicker;
        texts.inputAccessoryView = tools;

    }
    return self;
}
- (void)handleActionBarDone:(id)sender
{
    [self endEditing:YES];
    
}

@end
