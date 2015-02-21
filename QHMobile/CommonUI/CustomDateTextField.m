//
//  CustomTextField.m
//  QHMobile
//
//  Created by yao on 15/2/17.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "CustomDateTextField.h"

@implementation CustomDateTextField

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
         _datePicker = [[UIDatePicker alloc] init];
        _datePicker.backgroundColor = [UIColor whiteColor];
        UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 40)];
        tools.backgroundColor = [UIColor redColor];
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"完成", @"") style:UIBarButtonItemStyleDone target:self action:@selector(handleActionBarDone:)];
        UIBarButtonItem *leftflexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [tools setItems:[NSArray arrayWithObjects:leftflexible,doneButton, nil]];
//        UITextField *startTextView = [[UITextField alloc] initWithFrame:CGRectMake(startLab.left + startLab.width, 0, 100, self.height)];
//        [self addSubview:startTextView];
//        // [texts becomeFirstResponder];
//        startTextView.backgroundColor = [UIColor greenColor];
//        startTextView.inputView = _datePicker;
//        startTextView.inputAccessoryView = tools;
        self.backgroundColor = [UIColor greenColor];
        self.inputAccessoryView = tools;
        self.inputView = _datePicker;

    }
    return self;
}
- (void)handleActionBarDone:(id)sender
{
    [self endEditing:YES];
    
}


@end
