//
//  ZhuiZhuiViewController.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/6.
//
//

#import "BaseViewController.h"
#import <DZNSegmentedControl.h>
#import <SDCycleScrollView.h>
@interface ZhuiZhuiViewController : BaseViewController
@property (weak, nonatomic) IBOutlet DZNSegmentedControl *segmentView;
//@property (weak, nonatomic) IBOutlet SDCycleScrollView *bannerView;
//@property (weak, nonatomic) IBOutlet UICollectionView *typeOnewCollectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end
