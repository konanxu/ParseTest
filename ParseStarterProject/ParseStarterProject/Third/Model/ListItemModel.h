//
//  ListItemModel.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/10.
//
//

#import <Foundation/Foundation.h>
@class InfoModel;
@interface ListItemModel : NSObject
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *groupId;
@property (nonatomic,copy)NSString *groupName;
@property (nonatomic,copy)NSString *obj_type;
@property (nonatomic,copy)NSString *theme_id;
@property (nonatomic,strong)InfoModel *infoModel;
@property (nonatomic,strong)NSArray * theme_list;
@property (nonatomic,strong)NSArray *comics;

//"content" : "今日追追资讯",
//"id" : 56,
//"name" : "今日追追资讯",
//"obj_type" : 1,
//"theme_id" : 148,
//"theme_info" : {


@end
