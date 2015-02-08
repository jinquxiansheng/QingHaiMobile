//
//  CollectionCell.h
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KQCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *kqImg;
@property (assign, nonatomic)CGFloat cellWidth;
@property (assign,nonatomic) CGFloat cellHeight;

- (void)configCollectionCellContent:(NSInteger)row;


@end
