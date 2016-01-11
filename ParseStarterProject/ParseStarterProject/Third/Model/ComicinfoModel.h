//
//  ComicinfoModel.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import <Foundation/Foundation.h>

@interface ComicinfoModel : NSObject

@property (nonatomic,copy)NSString *comic_score;
@property (nonatomic,copy)NSString *cover_img;
@property (nonatomic,copy)NSString *finished;
@property (nonatomic,copy)NSString *have_comic_review;
@property (nonatomic,copy)NSString *have_resource;
@property (nonatomic,copy)NSString *infoId;
@property (nonatomic,copy)NSString *last_volume;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *read_mode;
@property (nonatomic,copy)NSString *review_count;
@property (nonatomic,copy)NSString *topic_count;

//"comic_score" : 9.9,
//"cover_img" : "http://image.zhuizhuiimg.com//image/1225702_1452139236.jpg",
//"finished" : 0,
//"have_comic_review" : 1,
//"have_resource" : 1,
//"id" : 40975,
//"last_volume" : "1 下",
//"name" : "猫狐恼",
//"read_mode" : 0,
//"review_count" : "7",
//"topic_count" : 23
@end
