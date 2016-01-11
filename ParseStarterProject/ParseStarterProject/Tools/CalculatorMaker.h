//
//  CalculatorMaker.h
//  ParseStarterProject
//
//  Created by Konan on 15/12/14.
//
//

#import <Foundation/Foundation.h>

@interface CalculatorMaker : NSObject
@property (nonatomic,assign) int result;

+ (int)makeCalculatorS:(void(^)(CalculatorMaker *make))calculatormake;

- (CalculatorMaker *(^)(int))add;
- (CalculatorMaker *(^)(int))sub;


@end
