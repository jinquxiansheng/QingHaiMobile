//
//  GlobalCellTableViewCell.h
//  QHMobile
//
//  Created by yao on 15/2/7.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalCellTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel    *title;
@property (nonatomic,strong) UILabel    *content;
@property (nonatomic,assign) CGFloat    cellHeight;
@property (nonatomic,strong)UIView      *sepLine;

- (void)configCellContent:(NSInteger) row ;
- (void)layoutSubViewsOnCell:(NSInteger) row ;
@end