//
//  RestRecordViewCell.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "RestRecordViewCell.h"

@implementation RestRecordViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor colorWithHex:0xFFECECEC];
    self.dateLabel.textColor = [UIColor colorWithHex:0xFFff8400];
    self.title.textColor = [UIColor colorWithHex:0xFFff8400];
    self.reasonView.backgroundColor = [UIColor colorWithHex:0xFFF6F6F6];
    self.content.backgroundColor = [UIColor colorWithHex:0xFFF6F6F6];
    self.content.text = @"测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试测试";

}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
