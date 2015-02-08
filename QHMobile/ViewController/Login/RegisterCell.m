//
//  RegisterCell.m
//  QHMobile
//
//  Created by yao on 15/2/7.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "RegisterCell.h"

@implementation RegisterCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        //验证码
        _validateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_validateBtn setBackgroundImage:[[UIImage imageNamed:@"anniu_1"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateNormal];
        [_validateBtn setBackgroundImage:[[UIImage imageNamed:@"anniu_1_on"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateHighlighted];
        CGFloat validateBtnWidth = 100;
        CGFloat validateHeight = 40;
        
        _validateBtn.frame = CGRectMake(SCREENWIDTH - validateBtnWidth-10, 10, validateBtnWidth, validateHeight);
        _validateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, validateBtnWidth, validateHeight)];
        _validateLabel.text = @"获取验证码";
        _validateLabel.textAlignment = NSTextAlignmentCenter;
        _validateLabel.textColor = [UIColor whiteColor];
        _validateLabel.font = [UIFont boldSystemFontOfSize:16];
        _validateLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
    
}
- (void)configCellContent:(NSInteger)row
{
    switch (row) {
        case 0:
        {
            [self.contentView addSubview:_validateBtn];
            [_validateBtn addSubview:_validateLabel];
            break;
        }
            
        default:
            break;
    }
}
//- (void)layoutSubviews
//{
//    
//    _validateBtn.frame = CGRectMake(SCREENWIDTH - 60, 2, 60, 30);
//}
@end
