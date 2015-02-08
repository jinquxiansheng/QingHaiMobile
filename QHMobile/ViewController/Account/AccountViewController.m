//
//  LikeViewController.m
//  QHMobile
//
//  Created by yao on 14-9-9.
//  Copyright (c) 2014年 yao. All rights reserved.
//

#import "AccountViewController.h"
#import "Test2ViewController.h"
#import "QHMainViewController.h"
#import "AccountCollectionViewCell.h"
#import "KQCollectionCell.h"
#import "RestRecordViewController.h"
#import "SimCardInsertViewController.h"
@interface AccountViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray  *_accountArray;
    CGFloat   _cellWidth;
    CGFloat   _cellHeight;
}
@end

@implementation AccountViewController

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
    [self customNavigationHeadTitle:@"账户信息"];
    
    [self.collectionView registerClass:[AccountCollectionViewCell class] forCellWithReuseIdentifier:@"AccountCollectionViewCell"];
    _accountArray = @[@"现金台帐",@"SIM卡台帐",@"有价卡台帐",@"现金台帐",@"SIM卡台帐",@"有价卡台帐",@"现金台帐",@"SIM卡台帐"];
    self.collectionView.backgroundColor = [UIColor colorWithHex:0xFFECECEC];

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore showBottomTab:YES];
    
    
}
- (void)navigationDone:(id)sender
{
    [self.navigationController pushViewController:[[Test2ViewController alloc] initWithNibName:@"Test2ViewController" bundle:nil] animated:YES];
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - collectionView dataSource Or delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _accountArray.count;
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
    AccountCollectionViewCell *cell = (AccountCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"AccountCollectionViewCell" forIndexPath:indexPath];
    cell.cellWidth = _cellWidth;
    cell.cellHeight = _cellHeight;
    [cell configCollectionCellContent:indexPath.row];
    cell.label.text = _accountArray[indexPath.row];
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
    if (indexPath.row == 1) {
        SimCardInsertViewController *cardCtrl = [[SimCardInsertViewController alloc] initWithNibName:@"SimCardInsertViewController" bundle:nil];
        [self.navigationController pushViewController:cardCtrl animated:YES];
    }
}


@end
