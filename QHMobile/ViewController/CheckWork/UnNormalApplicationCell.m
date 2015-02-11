//
//  LeaveApplicationCell.m
//  QHMobile
//
//  Created by yao on 15/2/8.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "UnNormalApplicationCell.h"
@interface UnNormalApplicationCell()<UITextViewDelegate>
{
    
}
@property (nonatomic,strong)UIButton             *leaveTypeBtn;
@property (nonatomic,strong)UILabel                 *titleLabel;
@property (nonatomic,strong)UITextView              *reasonTextView;
@property (nonatomic,strong) UIDatePicker           *datePicker;
@end

@implementation UnNormalApplicationCell

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)awakeFromNib {
    // Initialization code
    
    //self.CheckManagerBtn.backgroundColor = [UIColor colorWithHex:0xFFECECEC];
    
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //请假类别
        _leaveTypeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leaveTypeBtn.backgroundColor = [UIColor clearColor];
        [_leaveTypeBtn setTitleColor:[UIColor colorWithHex:0xFFBBBBBB] forState:UIControlStateNormal];
        [_leaveTypeBtn setTitle:@"请选择补卡类别" forState:UIControlStateNormal];
        [_leaveTypeBtn addTarget:self.delegate action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
        // 请假是由
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor colorWithHex:0Xffa3a1a1];
        //textview
        _reasonTextView = [[UITextView alloc] init];
        _reasonTextView.backgroundColor = [UIColor clearColor];
        _reasonTextView.textColor = [UIColor colorWithHex:0xFFa3a1a1];
        _reasonTextView.font = [UIFont systemFontOfSize:16];
        _reasonTextView.returnKeyType = UIReturnKeyDone;
        _reasonTextView.delegate = self;
    }
    return self;
}
- (void)configCellContent:(NSInteger)row
{
    switch (row) {
        case 0:
        {
            self.textLabel.text = @"补卡类别:";
            self.textLabel.textColor = [UIColor colorWithHex:0xFFff8400];
            [self.contentView addSubview:_leaveTypeBtn];
            break;
        }
        case 1:
        {
            [self.contentView addSubview:self.titleLabel];
            [self.contentView addSubview:_reasonTextView];
            self.titleLabel.text = @"事由:";
            self.reasonTextView.text = @"请输入补卡具体是由最多30个字符";
            break;
        }
        case 2:
        {
            self.textLabel.text = @"从";
            [self.contentView addSubview:_datePicker];
            break;
        }
        case 3:
        {
            self.textLabel.text = @"到";
            break;
        }
        case 4:
        {
            [self.contentView addSubview:self.titleLabel];
            self.titleLabel.text = @"共2天0小时";
            // self.titleLabel.frame = CGRectMake(130,  10, 150, 30);
            break;
        }
            
        default:
            break;
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _leaveTypeBtn.frame = CGRectMake(60, 0, 200, self.cellHeight);
    // _titleLabel.frame = CGRectMake(10, 10, 50, 30);
    _reasonTextView.frame = CGRectMake(50, 7, 280, 90);
    // _datePicker.frame = CGRectMake(40, 0, 200, 0);
    
    
}
- (void)layoutSubViewsOnCell:(NSInteger)row
{
    if (row == 4) {
        _titleLabel.frame = CGRectMake(130,  10, 150, 30);
    }
    else
        _titleLabel.frame = CGRectMake(10, 10, 50, 30);
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}
@end
