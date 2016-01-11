//
//  HomeTypeTwoTableViewCell.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import "HomeTypeTwoTableViewCell.h"
#import "HomePageTypeTwoCollectionViewCell.h"
#import "ListItemCollectionReusableView.h"
#import "ListItemTwoCollectionReusableView.h"
#import "ListItemModel.h"
static NSString  * const typeTwoCellIdentifier = @"typeTwoCellIdentifier";
static NSString  * const collectionCell2Identifier = @"HomePageTypeTwoCollectionViewCell";
static NSString  * const collectionHeaderIndentifier = @"typeOneHeaderIndentifier";
static NSString  * const collectionHeaderIndentifier2 = @"typeTwoHeaderIndentifier";

@implementation HomeTypeTwoTableViewCell

- (void)setModel:(ListItemModel *)model{
    _model =model;
    [self.myCollectionView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _model.comics.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomePageTypeTwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCell2Identifier forIndexPath:indexPath];
    cell.model =_model.comics[indexPath.row];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ListItemTwoCollectionReusableView *view = (ListItemTwoCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:collectionHeaderIndentifier2 forIndexPath:indexPath];
    view.headerTitleLabel.text = _model.groupName;
    return view;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
