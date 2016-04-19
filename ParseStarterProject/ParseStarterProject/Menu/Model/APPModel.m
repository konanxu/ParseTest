//
//  APPModel.m
//  ParseStarterProject
//
//  Created by Konan on 15/12/28.
//
//

#import "APPModel.h"

@interface APPModel()
{
    NSString *_str;
}
@end

@implementation APPModel

- (instancetype)init{
    self =[super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
       NSLog(@"%@",self.superclass); 
    }return self;
}
@end
