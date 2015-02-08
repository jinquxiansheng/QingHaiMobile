//
//  AccountCollectionViewCell.h
//  QHMobile
//
//  Created by yao on 15/2/5.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "KQCollectionCell.h"
@interface AccountCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *accountImg;
@property (assign, nonatomic)CGFloat cellWidth;
@property (assign,nonatomic) CGFloat cellHeight;

- (void)configCollectionCellContent:(NSInteger)row;@end
