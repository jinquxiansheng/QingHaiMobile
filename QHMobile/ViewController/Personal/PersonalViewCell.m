//
//  PersonalViewCell.m
//  QHMobile
//
//  Created by yao on 15/2/8.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "PersonalViewCell.h"
@interface PersonalViewCell()
{
    UIButton *_weiboBtn;
    UIButton *_qqBtn;
    UIButton *_weixinBtn;
}
@end
@implementation PersonalViewCell

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
    if (self) {
        
    }
    return self;
}
- (void)configCellContent:(NSInteger)row
{
//    if (row == 0) {
//        // weibo
////        CGFloat rightPadding = 20;
////        CGFloat spaceing = 10;
////        _weiboBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        [_weiboBtn setImage:[UIImage imageNamed:@"wb"] forState:UIControlStateNormal];
////        [self.contentView addSubview:_weiboBtn];
////        [_weiboBtn addWHConstraintsWithSuperView:self.contentView width:self.cellHeight height:self.cellHeight];
////        
////        [_weiboBtn addPaddingConstraintsWithSuperView:self.contentView top:0 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:rightPadding];
////        //qq
////        
////        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        [_qqBtn setImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
////        [self.contentView addSubview:_qqBtn];
////        [_qqBtn addTarget:self action:@selector(shareQQ:) forControlEvents:UIControlEventTouchUpInside];
////        [_qqBtn addWHConstraintsWithSuperView:self.contentView width:self.cellHeight height:self.cellHeight];
////        [_qqBtn addPaddingConstraintsWithSuperView:self.contentView top:0 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:rightPadding + self.cellHeight + spaceing];
////        CGFloat wexinSpaceing = rightPadding + 2*self.cellHeight + 2 *spaceing;
////        
////        _weixinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        [_weixinBtn setImage:[UIImage imageNamed:@"wx"] forState:UIControlStateNormal];
////        [self.contentView addSubview:_weixinBtn];
////        [_weixinBtn addWHConstraintsWithSuperView:self.contentView width:self.cellHeight height:self.cellHeight];
////        [_weixinBtn addPaddingConstraintsWithSuperView:self.contentView top:0 bottom:CGFLOAT_CONSTRAINTS_INVALID left:CGFLOAT_CONSTRAINTS_INVALID right:wexinSpaceing];
//
//    }
    
    
}
- (void)shareQQ:(UIButton *)button
{
    
}
@end
