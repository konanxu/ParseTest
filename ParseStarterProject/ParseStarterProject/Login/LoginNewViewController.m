//
//  LoginNewViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/9/21.
//
//

#import "LoginNewViewController.h"
#import <Parse/Parse.h>
#import "MainTabBarController.h"
#import "UserInfoDefault.h"
#import "ParseStarterProjectAppDelegate.h"
@interface LoginNewViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextFiled;

@end

@implementation LoginNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGes =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    
    [self.view addGestureRecognizer:tapGes];
    
//    [self.view addGestureRecognizer:[[UIGestureRecognizer alloc] ini]]
}

- (void)tapClick:(UITapGestureRecognizer *)tapGes{
    [self.userNameTextFiled resignFirstResponder];
    [self.userPasswordTextFiled resignFirstResponder];
}

- (IBAction)Login:(id)sender {
    [PFUser logInWithUsernameInBackground:self.userNameTextFiled.text  password:self.userPasswordTextFiled.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
            NSLog(@"Do stuff after successful login.");
            NSString *userName = user.username;
            [[NSUserDefaults standardUserDefaults] setObject:userName forKey:@"user_name"];
            [[NSUserDefaults standardUserDefaults] synchronize];
                 
                                            
            PFFile *userImageFile = [user objectForKey:@"userImageFile"];
            NSData *data = [userImageFile getData];
                                            
            [[UserInfoDefault shareUserInfoDefault] setUserName:user.username];
                                            [[UserInfoDefault shareUserInfoDefault] setData:data];
                                            
                                            
//            MainTabBarController *tbVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabBarController"];
//            tbVc.modalPresentationStyle = UIModalPresentationPopover;
//            [self presentViewController:tbVc animated:YES completion:nil];
                                            ParseStarterProjectAppDelegate *de=[UIApplication sharedApplication].delegate;
                                            [de buildUserInterFace];
                                        } else {
            NSLog(@"The login failed. Check error to see why.");
                                        }
                                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
