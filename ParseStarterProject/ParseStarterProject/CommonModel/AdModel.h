//
//  AdModel.h
//  ParseStarterProject
//
//  Created by Konan on 15/10/29.
//
//

#import <Foundation/Foundation.h>

@class Action_Params;
@interface AdModel : NSObject


@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *style;

@property (nonatomic, assign) NSInteger thirdplat;

@property (nonatomic, copy) NSString *video_url;

@property (nonatomic, assign) NSInteger ad_loc;

@property (nonatomic, assign) long long expired_time;

@property (nonatomic, copy) NSString *monitorShowUrl;

@property (nonatomic, strong) NSArray *res_url;

@property (nonatomic, copy) NSString *action;

@property (nonatomic, strong) Action_Params *action_params;

@property (nonatomic, copy) NSString *monitorClickUrl;

@property (nonatomic, copy) NSString *category;

@property (nonatomic, copy) NSString *flight_id;

@property (nonatomic, copy) NSString *main_title;

@property (nonatomic, copy) NSString *vdeg;

@property (nonatomic, copy) NSString *vdot;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *monitor;

@property (nonatomic, copy) NSString *sub_title;

@property (nonatomic, copy) NSString *show_time;

@property (nonatomic, copy) NSString *vdet;

@property (nonatomic, assign) NSInteger show_num;

@property (nonatomic, copy) NSString *ratio;

@property (nonatomic, assign) NSInteger ad_type;

@property (nonatomic, copy) NSString *vdog;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger is_sens;


@end
@interface Action_Params : NSObject

@end

