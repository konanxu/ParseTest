//
//  CommonManager.h
//  ParseStarterProject
//
//  Created by Konan on 15/10/29.
//
//

#import <Foundation/Foundation.h>
#import "Singeton.h"
#import <AFNetworking+PromiseKit.h>


@interface CommonManager : NSObject
@property (nonatomic, strong)AFHTTPRequestOperationManager *httpManager;
single_interface(CommonManager);


@end
