//
//  MessageTableViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/13.
//
//

#import "MessageTableViewController.h"

static NSString  * const kSegment1 = @"推荐";
static NSString  * const kSegment2 = @"资讯";
@implementation MessageTableViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self showHeaderGifWithState:YES];
    [self segementConfig];
}


- (void)segementConfig{
    self.segmentView.items = @[kSegment1,kSegment2];
    [self.segmentView setShowsCount:NO];
    [self.segmentView setHeight:49];
//    [self.segmentView setTintColor:[Utilities GetAladingColor]];
//    [self.segmentView setBackgroundColor:[Utilities GetSystemColor]];
//    [self.segmentView addTarget:self action:@selector(typeSegmentSwitched:) forControlEvents:UIControlEventValueChanged];
//    self.segmentView.selectedSegmentIndex = _isPush ? 1 : 0;
//    [self typeSegmentSwitched:self.segmentView];
//    NSMutableArray *btnArr =[[NSMutableArray alloc] init];
//    for (UIView *view in self.segmentView.subviews) {
//        if ([view isKindOfClass:[UIButton class]]) {
//            [btnArr addObject:view];
//        }
//    }
}
@end
