//
//  CollectionCell.m
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "KQCollectionCell.h"
@interface KQCollectionCell()
{
    UIView *sepline ;
    UIView  *sepline2;
    NSArray *_kqImgArray;
}
@end
@implementation KQCollectionCell

- (void)awakeFromNib {
    // Initialization code
   
    //self.CheckManagerBtn.backgroundColor = [UIColor colorWithHex:0xFFECECEC];
    self.label.textColor = [UIColor colorWithHex:0xFFa3a1a1];
    _kqImgArray = @[@"kq_iocn_1",@"kq_iocn_2",@"kq_iocn_3",@"kq_iocn_4",@"kq_iocn_5"];
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //[self.CheckManagerBtn setBackgroundColor:[UIColor colorWithHex:0xFFECECEC]];
        // 初始化时加载collectionCell.xib文件

        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"KQCollectionCell" owner:self options:nil];
        
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
        // label
        
        // 加载nib
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
    [self.kqImg setImage:[UIImage imageNamed:_kqImgArray[row]]];
    
}

@end
