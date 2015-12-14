//
//  CaculatorMaker.h
//  ParseStarterProject
//
//  Created by Konan on 15/12/14.
//
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject
@property (nonatomic,assign) int result;

+ (int)makeCalculatorS:(void(^)(CaculatorMaker *make))calculatormake;

- (CaculatorMaker *(^)(int))add;
- (CaculatorMaker *(^)(int))sub;


@end
