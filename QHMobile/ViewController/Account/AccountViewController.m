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
#import "CollectionCell.h"
#import "RestRecordViewController.h"
@interface AccountViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray  *_accountArray;
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
    [self customNavigationBack:@"dading" normalImage:@"like" highlightImage:@""];
    [self customNavigationDone:@"完成" normalImage:@"" highlightImage:@""];
    
    [self.collectionView registerClass:[AccountCollectionViewCell class] forCellWithReuseIdentifier:@"AccountCollectionViewCell"];
    _accountArray = @[@"现金台帐",@"SIM卡台帐",@"有价卡台帐",@"现金台帐",@"SIM卡台帐",@"有价卡台帐",@"现金台帐",@"SIM卡台帐"];
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
    CGFloat cellWidth = SCREENWIDTH / 3 ;
    if (iPhone6 || iPhone6Plus) {
        cellWidth -= 1;
    }
    return CGSizeMake(cellWidth, 105);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AccountCollectionViewCell *cell = (AccountCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"AccountCollectionViewCell" forIndexPath:indexPath];
    
    //图片名称
    // NSString *imageToLoad = [NSString stringWithFormat:@"%d.png", indexPath.row];
    //加载图片
    // cell.imageView.image = [UIImage imageNamed:imageToLoad];
    //设置label文字
    cell.label.text = _accountArray[indexPath.row];
    cell.label.backgroundColor = [UIColor yellowColor];
    
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
