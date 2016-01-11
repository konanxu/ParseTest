//
//  LoginViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/9/18.
//
//

#import "LoginViewController.h"
#import <Parse/Parse.h>
#import "LoginNewViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (weak, nonatomic) IBOutlet UITextField *userPwd;
@property (weak, nonatomic) IBOutlet UITextField *userEmail;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)LoginSubmit:(id)sender {
    PFUser *user = [PFUser user];
    user.username = _userName.text;
    user.password = _userPwd.text;
    user.email = _userEmail.text;
    // other fields can be set just like with PFObject
    user[@"phone"] = @"415-392-0202";
    
    
    NSData *data = UIImageJPEGRepresentation(_userImageView.image, 1);
    if (data!=nil) {
        PFFile *userImageFile = [PFFile fileWithData:data];
        [user setObject:userImageFile forKey:@"userImageFile"];
    }
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"注册成功！");
            
            LoginNewViewController *newVC =[[LoginNewViewController alloc] init];
            [self presentViewController:newVC animated:YES completion:^{
            }];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (IBAction)addUserPic:(id)sender {
    UIImagePickerController *vc =[[UIImagePickerController alloc] init];
    vc.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
    vc.delegate=self;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    _userImageView.image =info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
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
