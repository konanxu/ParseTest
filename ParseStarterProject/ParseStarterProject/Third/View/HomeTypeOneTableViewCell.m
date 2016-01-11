//
//  HomeTypeOneTableViewCell.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import "HomeTypeOneTableViewCell.h"
#import "HomePageTypeOneCollectionViewCell.h"
#import "ListItemCollectionReusableView.h"
#import "ListItemModel.h"
static NSString  * const bannerCellIdentifier = @"bannerCellIdentifier";
static NSString  * const typeOneCellIdentifier = @"typeOneCellIdentifier";
static NSString  * const collectionCell1Identifier = @"HomePageTypeOneCollectionViewCell";
static NSString  * const collectionHeaderIndentifier = @"typeOneHeaderIndentifier";

@implementation HomeTypeOneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(ListItemModel *)model{
    _model =model;
    [self.myCollectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _model.theme_list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomePageTypeOneCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell1Identifier forIndexPath:indexPath];
    cell.model =_model.theme_list[indexPath.row];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ListItemCollectionReusableView *view = (ListItemCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderIndentifier forIndexPath:indexPath];
    view.headerTitleLabel.text = _model.groupName;
    return view;
}





@end
