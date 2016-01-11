//
//  ImageTestViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/11/18.
//
//

#import "ImageTestViewController.h"

@interface ImageTestViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *MyImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;

@end

@implementation ImageTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.MyImageView.image =[UIImage imageNamed:@"conan.jpg"];
    
    
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
