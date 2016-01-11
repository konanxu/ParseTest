//
//  ZhuiZhuiViewController.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/6.
//
//

#import "ZhuiZhuiViewController.h"
#import <SDCycleScrollView.h>
#import "CommonManager.h"
#import "NSString+Util.h"
#import <MJExtension.h>
#import "BannerModel.h"
#import "InfoModel.h"
#import "ListItemModel.h"
#import "ListItemCollectionReusableView.h"
#import "HomePageTypeOneCollectionViewCell.h"
static NSString  * const kSegment1 = @"推荐";
static NSString  * const kSegment2 = @"资讯";
static NSString  * const collectionCell1Identifier = @"HomePageTypeOneCollectionViewCell";
static NSString  * const collectionHeaderIndentifier = @"typeOneHeaderIndentifier";
//#define kWebPath @"http://api.zhuizhuiyoyo.com/request.php"

@interface ZhuiZhuiViewController (){
    NSMutableArray *_bannerArr;
    
    NSMutableArray *_listArr;
}

@end

@implementation ZhuiZhuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self uiConfig];
}
- (void)uiConfig{
    [self segementConfig];
    self.myScrollView.contentSize = CGSizeMake(320, 456);
    self.myScrollView.contentOffset=CGPointMake(0, 0);
    

    
    
    
//    [self.typeOnewCollectionView registerClass:[HomePageTypeOneCollectionViewCell class] forCellWithReuseIdentifier:collectionCell1Identifier];
//    [selxf.typeOnewCollectionView registerClass:[ListItemCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderIndentifier];
//    UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)self.typeOnewCollectionView.collectionViewLayout;
//    collectionViewLayout.headerReferenceSize = CGSizeMake(320, 40);
}
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    HomePageTypeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell1Identifier forIndexPath:indexPath];
//    ListItemModel *model = _listArr[0];
//    cell.model =model.theme_list[indexPath.row];
//    return cell;
//}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    ListItemCollectionReusableView *view = (ListItemCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderIndentifier forIndexPath:indexPath];
//    ListItemModel *model = _listArr[0];
//    view.headerTitleLabel.text = model.content;
//    return view;
//}




//- (void)configBanner{
//    // 网络加载图片的轮播器
//    NSArray * imagesURLStrings =[[NSArray alloc] init];
//    NSArray * titlesURLStrings =[[NSArray alloc] init];
//    for (BannerModel *model in _bannerArr) {
//       imagesURLStrings= [imagesURLStrings arrayByAddingObject:model.infoModel.cover];
//        titlesURLStrings = [titlesURLStrings arrayByAddingObject:model.infoModel.name];
//    }
//    self.bannerView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    self.bannerView.imageURLStringsGroup = imagesURLStrings;
//    self.bannerView.titlesGroup =titlesURLStrings;
//    self.bannerView.pageControlDotSize= CGSizeMake(6,6);
//    // 本地加载图片的轮播器
////    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame: imagesGroup:图片数组];
//}

- (void)segementConfig{
    self.segmentView.items = @[kSegment1,kSegment2];
    [self.segmentView setShowsCount:NO];
    self.segmentView.autoAdjustSelectionIndicatorWidth = NO;
    self.segmentView.adjustsFontSizeToFitWidth =NO;
    [self.segmentView setHeight:49];
    [self.segmentView addTarget:self action:@selector(typeSegmentSwitched:) forControlEvents:UIControlEventValueChanged];
}

- (void)typeSegmentSwitched:(id)sender {
    self.segmentView  = sender;
    if (self.segmentView.selectedSegmentIndex == 0) {
        self.myScrollView.contentOffset =CGPointMake(0, 0);
    }else{
        self.myScrollView.contentOffset =CGPointMake(320, 0);
    }
}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    ListItemModel *model =_listArr[0];
//    
//    return model.theme_list.count;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
