//
//  MainTabBarController.m
//  ParseStarterProject
//
//  Created by Konan on 15/9/21.
//
//

#import "MainTabBarController.h"
#import <Parse/Parse.h>
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFQuery *query = [PFQuery queryWithClassName:@"States"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *states, NSError *error) {
        NSLog(@"%@",states);
    }];
    
//    [query getObjectInBackgroundWithId:@"1KLOBEfOGM" block:^(PFObject *stetas, NSError *error) {
//        // Do something with the returned PFObject in the gameScore variable.
//        NSLog(@"%@", stetas);
//    }];
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
