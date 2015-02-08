//
//  AccountCollectionViewCell.m
//  QHMobile
//
//  Created by yao on 15/2/5.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "AccountCollectionViewCell.h"
@interface AccountCollectionViewCell()
{
    UIView *sepline ;
    UIView  *sepline2;
    NSArray *_accountImgArray;
}
@end

@implementation AccountCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    self.label.textColor = [UIColor colorWithHex:0xFFa3a1a1];
    _accountImgArray = @[@"icon_1",@"icon_2",@"icon_3",@"icon_4",@"icon_5",@"icon_6",@"icon_7",@"icon_8"];

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"AccountCollectionViewCell" owner:self options:nil];
        
        // 如果路径不存在，return nil
        if (arrayOfViews.count < 1)
        {
            return nil;
        }
        // 如果xib中view不属于UICollectionViewCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        // 加载nib
        self = [arrayOfViews objectAtIndex:0];
        self = [arrayOfViews objectAtIndex:0];
        sepline = [[UIView alloc]init];
        sepline.backgroundColor = [UIColor colorWithHex:0xFFD4D4D4];
        [self addSubview:sepline];
        
        sepline2 = [[UIView alloc]init];
        sepline2.backgroundColor = [UIColor colorWithHex:0xFFD4D4D4];
        [self addSubview:sepline2];

        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    sepline.frame = CGRectMake(self.cellWidth - 1, 0, 1, self.cellHeight);
    sepline2.frame = CGRectMake(0, self.cellHeight - 1, self.cellWidth, 1);
}
- (void)configCollectionCellContent:(NSInteger)row
{
    [self.accountImg setImage:[UIImage imageNamed:_accountImgArray[row]]];
    
}


@end
