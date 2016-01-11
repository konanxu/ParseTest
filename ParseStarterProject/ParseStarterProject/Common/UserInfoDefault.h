//
//  UserInfoDefault.h
//  ParseStarterProject
//
//  Created by Konan on 15/10/12.
//
//

#import <Foundation/Foundation.h>
#import "Singeton.h"
@interface UserInfoDefault : NSObject
@property (nonatomic,copy) NSString * userName;
@property (nonatomic,strong) NSData * data;
single_interface(UserInfoDefault);
@end
