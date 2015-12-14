//
//  NSString+Util.h
//  AladingMobileApp
//
//  Created by Konan on 15/6/25.
//  Copyright (c) 2015年 Alading. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)
- (BOOL)isEmpty;

- (BOOL)containsEmojiString;

+ (NSString *)stringFromDictionary:(NSDictionary *)objectDictionary;



+(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary;
+(NSString *) jsonStringWithArray:(NSArray *)array;
+(NSString *) jsonStringWithString:(NSString *) string;
+(NSString *) jsonStringWithObject:(id) object;
@end
