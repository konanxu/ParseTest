//
//  BaseTableViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/13.
//
//

#import "BaseTableViewController.h"
#import <MJRefresh.h>
@implementation BaseTableViewController
{
    NSMutableArray * _pullArrayImages;
    NSMutableArray * _shakeArrayImages;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    [self imageLoad];
}
- (void)imageLoad{
    _pullArrayImages =[[NSMutableArray alloc] init];
    _shakeArrayImages =[[NSMutableArray alloc] init];
   NSArray * pullArray =@[@"icon_pull_animation_1",@"icon_pull_animation_2",@"icon_pull_animation_3",@"icon_pull_animation_4",@"icon_pull_animation_5"];
    NSArray * shakeArray =@[@"icon_shake_animation_1",@"icon_shake_animation_2",@"icon_shake_animation_3",@"icon_shake_animation_4",
                   @"icon_shake_animation_5",@"icon_shake_animation_6",@"icon_shake_animation_7",@"icon_shake_animation_8"];
    for (NSString *name in pullArray) {
        UIImage *image =[UIImage imageNamed:name];
        [_pullArrayImages addObject:image];
    }
    for (NSString *name in shakeArray) {
        UIImage *image =[UIImage imageNamed:name];
        [_shakeArrayImages addObject:image];
    }
}

- (void)showHeaderGifWithState:(BOOL)state{
    if (state) {
//        MJRefreshGifHeader *header =[MJRefreshGifHeader headerWithRefreshingBlock:^{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [header endRefreshing];
//            });
//        }];
        
        self.tableView.header =[MJRefreshGifHeader headerWithRefreshingBlock:^{
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.tableView.header endRefreshing];
            });
        }];
        MJRefreshGifHeader *header = (MJRefreshGifHeader *)self.tableView.header;
        
        [header setImages:@[[UIImage imageNamed:@"icon_transform_animation"]] forState:MJRefreshStateIdle];
        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        [header setImages:_pullArrayImages forState:MJRefreshStatePulling];
        // 设置正在刷新状态的动画图片
        [header setImages:_shakeArrayImages forState:MJRefreshStateRefreshing];
        
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        // 设置header
//        self.tableView.header = header;
    }else{
        self.tableView.header = nil;
    }
    
}




@end
