//
//  BaseView.h
//  QHMobile
//
//  Created by yao on 14-9-7.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QHMGlobal.h"


@interface BaseView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *baseTableView;
@end
