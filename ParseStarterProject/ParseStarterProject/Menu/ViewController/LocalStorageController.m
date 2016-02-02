//
//  LocalStorageController.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/14.
//
//

#import "LocalStorageController.h"
#import <Masonry.h>
@interface LocalStorageController ()

@end

@implementation LocalStorageController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *iView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"intro_icon_2"]];
    [self.view addSubview:iView];
    self.view.backgroundColor =[UIColor yellowColor];
    [iView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(self.view).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));

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
