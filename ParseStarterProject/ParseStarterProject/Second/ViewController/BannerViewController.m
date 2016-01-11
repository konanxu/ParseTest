//
//  BannerViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/13.
//
//

#import "BannerViewController.h"
#import "BannerCell.h"


@interface BannerViewController()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *bannerView;

@end

@implementation BannerViewController 
- (void)viewDidLoad{
    [super viewDidLoad];
    _bannerView.delegate=self;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    BannerCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:@"BannerCell" forIndexPath:indexPath];
    [cell.verticalButton setTitle:[NSString stringWithFormat:@"%ld",indexPath.row] forState:UIControlStateNormal];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 16;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((CGRectGetWidth(_bannerView.bounds) - 24)/4, 67.5);
}
@end
