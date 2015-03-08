//
//  QHMLoginViewController.m
//  QHMobile
//
//  Created by yao on 15/2/3.
//  Copyright (c) 2015年 yao. All rights reserved.
//

#import "QHMLoginViewController.h"
#import "QHRegisterViewController.h"
#import "NavBaseViewController.h"
#import "CheckButton.h"
#import "QHMLoginViewController+HandleReturnInfo.h"
#import "InteralCache.h"
#define kIDTextTag                  1 
#define kPwdTextTag                 2
@interface QHMLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *userID;
@property (weak, nonatomic) IBOutlet UITextField *userPwd;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;
@property (weak, nonatomic) IBOutlet UIImageView *regisertImgTip;
@property (weak, nonatomic) IBOutlet UIButton *goRegister;
@property (weak, nonatomic) IBOutlet UIImageView *idImgFocus;
@property (weak, nonatomic) IBOutlet UIImageView *pwdImgFocus;
@property (weak, nonatomic) IBOutlet CheckButton *remberPwdBtn;



- (IBAction)LoginAction:(id)sender;
- (IBAction)goRegister:(id)sender;

- (IBAction)remberPwdAction:(id)sender;
@end

@implementation QHMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.loginBtn setTitleColor:[UIColor colorWithHex:0xFF424242] forState:UIControlStateNormal];
    self.navigationController.navigationBarHidden = YES;
    if (iPhone4)
    {
        self.loginView.top -= 44;
        self.loginView.height += 40;
    }
    CGFloat tipPadding = -10;
    if (iPhone6)
        tipPadding = 20;
    if (iPhone6Plus)
        tipPadding = 40;
    self.regisertImgTip.left = self.registerBtn.left + self.registerBtn.width + tipPadding;
    //tag
    self.userID.tag = kIDTextTag ;
    self.userPwd.tag = kPwdTextTag;
    
    //tap
    UITapGestureRecognizer  *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    [self.view addGestureRecognizer:tap];
    
    LoginUserModel *loginModel = [[InteralCache shareInteralCache] selectLoginInfo];
    NSLog(@"log %@",loginModel.remSign);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [theUICore hiddenLoginNav:YES];

}

- (void)hideKeyBoard
{
    [self.userPwd resignFirstResponder];
    [self.userID resignFirstResponder];
}
#pragma mark --判断当开始编辑文本框时候，黄色线条是否出现
- (void)showFocusImageWithTextFieldTag:(NSInteger)tag
{
    if (tag == kIDTextTag) {
        self.idImgFocus.hidden = !self.idImgFocus.hidden ;
    }
    if (tag == kPwdTextTag) {
        self.pwdImgFocus.hidden = !self.pwdImgFocus.hidden;
    }

}
#pragma mark -textfield 
- (void)textFieldDidBeginEditing:(UITextField *)textField         // became first responder
{
    [self showFocusImageWithTextFieldTag:textField.tag];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
   [self showFocusImageWithTextFieldTag:textField.tag];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (IBAction)LoginAction:(id)sender {
     [self handleResultWithStastu:@"1"];
    NSString *remSign = self.remberPwdBtn.checkOn ? @"1":@"0";
    [[InteralCache shareInteralCache] saveEmployeeWithID:self.userID.text  pwd:self.userPwd.text rememberPwd:remSign];
    //NSLog(@"%@",[[InteralCache shareInteralCache] selectPwdWithID:self.userID.text]);
//    HttpCallBack *selfCallBack = [[HttpCallBack alloc] init];
//    QHMLoginViewController    *bself = (QHMLoginViewController *)self;
//    selfCallBack.doneBlock = ^(BaseModel *info,NSUInteger tag)
//    {
//        [bself handleResultWithStastu:info.status];
//         NSLog(@"%@",info.info);
//    };
//    selfCallBack.failedBlock = ^(NSError *error)
//    {
//        if (error.NetState == ErrorNoNet)
//        {
//        }
//    };
//   [MANAGER loginWithPhone:@"13301398220" pwd:@"123456" callBack:selfCallBack target:self];
//  // [MANAGER checkinWithLng:@"102.112239" lat:@"36.504831" gid:@"1" address:@"青海省海东地区平安县平安路122" callBack:selfCallBack];
//   // [MANAGER selectDepartmentWithID:@"1" callBack:selfCallBack];
//    [MANAGER checkListWithCallBack:selfCallBack];
   // [MANAGER checkWithType:@"1" callBack:selfCallBack];
   // [MANAGER workApplicationWithType: ctype:<#(NSString *)#> s_time:<#(NSString *)#> e_time:<#(NSString *)#> reason:(NSString *) callBack:<#(HttpCallBack *)#>];
    //[MANAGER applicationListMoreWithType:@"1" callBack:selfCallBack];
   // [MANAGER accountListWithCallBack:selfCallBack];
   //  [MANAGER submitApplicationListMoreWithItem:<#(NSString *)#> callBack:<#(HttpCallBack *)#>];
   // [MANAGER userAllInfoWithCallBack:selfCallBack];
}


- (IBAction)goRegister:(id)sender {
//    QHRegisterViewController *registerCtrl = [[QHRegisterViewController alloc] initWithNibName:@"QHRegisterViewController" bundle:nil];
//    
//    [theUICore.loginNav pushViewController:registerCtrl animated:YES];
//    [MBProgressHUD showHUDAddedTo:self.view
//                         animated:YES];
 //   [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(hideProgess) userInfo:nil repeats:NO];
}

//- (void)hideProgess
//{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//}
- (IBAction)remberPwdAction:(id)sender {
    if (!self.remberPwdBtn.checkOn)
        [self.remberPwdBtn setImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
    else
        [self.remberPwdBtn setImage:[UIImage imageNamed:@"checkbox"] forState:UIControlStateNormal];
        
    self.remberPwdBtn.checkOn = !self.remberPwdBtn.checkOn ;

}
@end
