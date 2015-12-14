//
//  CalculatorMaker.m
//  ParseStarterProject
//
//  Created by Konan on 15/12/14.
//
//

#import "CalculatorMaker.h"

@implementation CalculatorMaker


- (CalculatorMaker *(^)(int))add{
    return  ^id(int result){
        self.result +=result;
        return self;
    };
}

+ (int)makeCalculatorS:(void(^)(CalculatorMaker *make))calculatormake{
    CalculatorMaker *make  =[[CalculatorMaker alloc] init];
    calculatormake(make);
    return make.result;
}
- (CalculatorMaker *(^)(int))sub{
    return ^id(int result){
        self.result-=result;
        return self;
    };
}

@end
