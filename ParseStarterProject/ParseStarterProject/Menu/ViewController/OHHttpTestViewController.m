//
//  OHHttpTestViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/12/25.
//
//

#import "OHHttpTestViewController.h"
#import <Masonry.h>
@interface OHHttpTestViewController ()

@end

@implementation OHHttpTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn =({
        UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
        btn.titleLabel.text = @"获取";
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(40);
        }];
        btn;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
