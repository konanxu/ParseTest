//
//  LeftSideController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/15.
//
//

#import "LeftSideController.h"
#import "MainTabBarController.h"
#import "ParseStarterProjectAppDelegate.h"
#import <MMDrawerController.h>
#import <Parse/Parse.h>
#import "LoginNewViewController.h"
@interface LeftSideController()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * _array;
}
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation LeftSideController

- (void)viewDidLoad{
    [super viewDidLoad];
    _array = @[@"菜单",@"关于",@"退出"];
    
    _userNameLabel.text =[[PFUser currentUser] objectForKey:@"username"];
    PFFile *file =[[PFUser currentUser] objectForKey:@"userImageFile"];
    [file getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.userImageView.image = [UIImage imageWithData:imageData];
        }
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"点击第1行");
            
            MainTabBarController *main =[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MainTabBarController"];
            
            ParseStarterProjectAppDelegate *dele =[UIApplication sharedApplication].delegate;
            
            dele.drawerContainer.centerViewController = main;
            
            [dele.drawerContainer toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
            
            break;
        }
        case 1:
        {
            NSLog(@"点击第2行");
            MainTabBarController *main =[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"MainTabBarController"];
            main.selectedIndex =1;
            ParseStarterProjectAppDelegate *dele =[UIApplication sharedApplication].delegate;
            
            dele.drawerContainer.centerViewController = main;
            
            [dele.drawerContainer toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
            break;
        }
        case 2:
            NSLog(@"点击第3行");
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_name"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [PFUser logOutInBackgroundWithBlock:^(NSError *error){
                LoginNewViewController * vc=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginNewViewController"];
                [UIApplication sharedApplication].keyWindow.rootViewController =vc;
            }];
            
            break;
        default:
            NSLog(@"没有响应");
            break;
    }
}
@end
