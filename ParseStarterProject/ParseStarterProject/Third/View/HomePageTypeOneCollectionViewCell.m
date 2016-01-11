//
//  HomePageTypeOneCollectionViewCell.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/10.
//
//

#import "HomePageTypeOneCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "InfoModel.h"
@implementation HomePageTypeOneCollectionViewCell
- (void)setModel:(InfoModel *)model{
    _model =model;
    [self.typeOneImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:[UIImage imageNamed:@"placeholder_banner"] options:SDWebImageLowPriority|SDWebImageRefreshCached];
    self.typeOneLabel.text = model.name;
}
@end
