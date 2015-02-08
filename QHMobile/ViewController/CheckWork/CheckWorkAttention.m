//
//  SortViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "CheckWorkAttention.h"
#import "KQCollectionCell.h"
#import "RestRecordViewController.h"
@interface CheckWorkAttention ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray  *_checkArray;
    CGFloat   _cellWidth;
    CGFloat   _cellHeight;
}
@end

@implementation CheckWorkAttention

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self customNavigationHeadTitle:@"考勤管理"];
    [self.collectionView registerClass:[KQCollectionCell class] forCellWithReuseIdentifier:@"KQCollectionCell"];
    self.collectionView.backgroundColor = [UIColor colorWithHex:0xFFECECEC];

    _checkArray = @[@"请假申请",@"加班申请",@"异常补卡",@"考勤记录",@"考勤日志"];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:YES];
     
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - collectionView dataSource Or delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _checkArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"%d",SCREENWIDTH);
     _cellWidth = SCREENWIDTH / 3 ;
    _cellHeight = 130;

    if (iPhone6 || iPhone6Plus) {
        _cellWidth -= 1;
        _cellHeight += 10;
    }
    return CGSizeMake(_cellWidth, _cellHeight);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   KQCollectionCell  *cell = (KQCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"KQCollectionCell" forIndexPath:indexPath];
    cell.cellWidth = _cellWidth;
    cell.cellHeight = _cellHeight;
    [cell configCollectionCellContent:indexPath.row];
    //图片名称
   // NSString *imageToLoad = [NSString stringWithFormat:@"%d.png", indexPath.row];
    //加载图片
   // cell.imageView.image = [UIImage imageNamed:imageToLoad];
    //设置label文字
    cell.label.text = _checkArray[indexPath.row];
    UIView *selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, _cellHeight)];
    selectView.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = selectView;
    return cell;

}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        RestRecordViewController *restCtrl = [[RestRecordViewController alloc] initWithNibName:@"RestRecordViewController" bundle:nil];
        [self.navigationController pushViewController:restCtrl animated:YES];
    }
    
}

@end
