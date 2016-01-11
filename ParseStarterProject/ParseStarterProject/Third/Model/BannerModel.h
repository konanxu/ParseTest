//
//  BannerModel.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/10.
//
//

#import <Foundation/Foundation.h>
@class InfoModel;
@interface BannerModel : NSObject

@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *bannerId;
@property (nonatomic,copy)NSString *theme_id;
@property (nonatomic,strong)InfoModel * infoModel;

//"content" : "从前有座山，山里有俩基佬……诶不对",
//"id" : 596,
//"theme_id" : 4278,
//"theme_info" : {
//    "can_filter" : 0,
//    "comment_count" : 0,
//    "cover" : "http://image.zhuizhuiimg.com//image/1226757_1452151976.jpg",
//    "id" : 4278,
//    "name" : "从前有座山，山里有俩基佬……诶不对",
//    "up_count" : 0,
//    "url" : "zzComic://RC.com/40975"
//}
@end
