//
//  RestRecordViewCell.h
//  QHMobile
//
//  Created by yao on 15/2/4.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestRecordViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *headView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *reasonView;

@property (weak, nonatomic) IBOutlet UITextView *content;

@end
