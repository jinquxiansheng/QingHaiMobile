//
//  GlobalCellTableViewCell.m
//  QHMobile
//
//  Created by yao on 15/2/7.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "GlobalCellTableViewCell.h"
@interface GlobalCellTableViewCell ()
{
    
}
@property (nonatomic,strong)UIView  *sepLine;
@end
@implementation GlobalCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    UIView *sepLine = [[UIView alloc] initWithFrame:CGRectMake(0, _cellHeight - 1, SCREENWIDTH, 1)];
//    sepLine.backgroundColor = [UIColor colorWithHex:0xfff8f8f8];
//    [cell.contentView addSubview:sepLine];
//    cell.contentView.backgroundColor = [UIColor colorWithHex:0xfffffeff];
//}
//cell.textLabel.text = _registerArray[indexPath.row];
//cell.textLabel.textColor = [UIColor colorWithHex:0Xffa3a1a1];
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.backgroundColor = [UIColor colorWithHex:0xfffffeff];
        self.textLabel.textColor = [UIColor colorWithHex:0Xffa3a1a1];
        _sepLine = [[UIView alloc]init];
        _sepLine.backgroundColor = [UIColor colorWithHex:0xfff8f8f8];
        [self.contentView addSubview:_sepLine];
    }
    return self;
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    _sepLine.frame = CGRectMake(0, _cellHeight - 1, SCREENWIDTH, 1);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
