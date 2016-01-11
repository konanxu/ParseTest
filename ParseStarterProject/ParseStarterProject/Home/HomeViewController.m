//
//  HomeViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/12.
//
//

#import "HomeViewController.h"
#import "UserInfoDefault.h"
#import "ParseStarterProjectAppDelegate.h"
#import <RegexKitLite.h>
#import "CalculatorMaker.h"
#import <Masonry.h>
@interface HomeViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _userImageView.image =[UIImage imageWithData:[UserInfoDefault shareUserInfoDefault].data];
    _userNameLabel.text =[UserInfoDefault shareUserInfoDefault].userName;
 
   int i = [CalculatorMaker makeCalculatorS:^(CalculatorMaker *make) {
        make.add(123).add(1);
    }];
    
    NSLog(@"%i",i);
    
//    UIView *view =({
//        UIView *view =[[UIView alloc] init];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(view.superview.mas_left).with.offset(10);
//        }];
//        view;
//    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)leftBarBtnClick:(id)sender {
    ParseStarterProjectAppDelegate *dele = [UIApplication sharedApplication].delegate;
    [dele.drawerContainer toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    dele.drawerContainer .openDrawerGestureModeMask =MMOpenDrawerGestureModeBezelPanningCenterView;
    dele.drawerContainer .closeDrawerGestureModeMask =MMCloseDrawerGestureModePanningCenterView;
}
- (IBAction)rightBarBtnClick:(id)sender {
    ParseStarterProjectAppDelegate *dele = [UIApplication sharedApplication].delegate;
    [dele.drawerContainer toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
    dele.drawerContainer .openDrawerGestureModeMask =MMOpenDrawerGestureModeBezelPanningCenterView;
    dele.drawerContainer .closeDrawerGestureModeMask =MMCloseDrawerGestureModePanningCenterView;
}
- (IBAction)submit:(id)sender {
  NSString *a =  @"^[A-Za-z0-9]+$";
    if ([_myTextField.text isMatchedByRegex:a]) {
        NSLog(@"%@: 验证通过",_myTextField.text);
    }else{
        NSLog(@"%@: 失败",_myTextField.text);
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
