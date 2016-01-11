//
//  LayoutCell.m
//  ParseStarterProject
//
//  Created by Konan on 15/12/28.
//
//

#import "LayoutCell.h"
#import <UIImageView+WebCache.h>
@implementation LayoutCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(APPModel *)model{
    _model =model;
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:_model.imgUrl]placeholderImage:nil options:SDWebImageLowPriority|SDWebImageRefreshCached];
    self.decLabel.text = _model.decStr;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
   return [super initWithStyle:style reuseIdentifier:reuseIdentifier];
}

//- (CGSize)sizeThatFits:(CGSize)size {
//    CGFloat totalHeight = 0;
//    totalHeight += [self.logoImageView sizeThatFits:size].height;
//    totalHeight += [self.decLabel sizeThatFits:size].height;
////    totalHeight += 40; // margins
//    return CGSizeMake(size.width, totalHeight);
//}
@end
