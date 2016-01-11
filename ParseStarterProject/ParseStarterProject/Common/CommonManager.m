//
//  CommonManager.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/29.
//
//

#import "CommonManager.h"




@interface CommonManager()

//@property (nonatomic, strong)AFHTTPRequestOperationManager *httpManager;

@end

@implementation CommonManager

single_implementation(CommonManager);

- (AFHTTPRequestOperationManager *)httpManager {
    if (_httpManager) {
        return _httpManager;
    }
    self.httpManager = [[AFHTTPRequestOperationManager alloc] init];
    [self.httpManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.httpManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    self.httpManager.responseSerializer.acceptableContentTypes =[self.httpManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//    [NSSet setWithObjects:@"text/html",@"text/json",nil];
    return _httpManager;
}




@end
