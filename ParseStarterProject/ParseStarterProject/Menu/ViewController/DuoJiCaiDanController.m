//
//  DuoJiCaiDanController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/20.
//
//

#import "DuoJiCaiDanController.h"

@interface DuoJiCaiDanController()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintsHeight;

@end

@implementation DuoJiCaiDanController
- (IBAction)mutilClick:(id)sender {
    if (_constraintsHeight.constant==0) {
        _constraintsHeight.constant=300;
    }else{
        _constraintsHeight.constant=0;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
