//
//  QHMobileLabel.m
//  QHMobile
//
//  Created by yao on 15/2/11.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMobileLabel.h"

@implementation QHMobileLabel

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
    self.textColor = [UIColor colorWithHex:0xFF555555];
    
}

@end
