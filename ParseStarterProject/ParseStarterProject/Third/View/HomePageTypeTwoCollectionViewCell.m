//
//  HomePageTypeTwoCollectionViewCell.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import "HomePageTypeTwoCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "ComicinfoModel.h"
@implementation HomePageTypeTwoCollectionViewCell
- (void)setModel:(ComicinfoModel *)model{
    _model =model;
    [self.typeTwoImageView sd_setImageWithURL:[NSURL URLWithString:model.cover_img] placeholderImage:[UIImage imageNamed:@"placeholder_banner"] options:SDWebImageLowPriority|SDWebImageRefreshCached];
    self.typeTwoLabel.text = model.name;
}
@end
