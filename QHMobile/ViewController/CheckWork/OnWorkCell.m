//
//  OnWorkCell.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "OnWorkCell.h"

@implementation OnWorkCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib {
    // Initialization code
    
    [super awakeFromNib];
    self.workStateLabel.textColor = [UIColor colorWithHex:0xFF0b74c8];
    
}


@end
