//
//  BannerCell.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/13.
//
//

#import "BannerCell.h"
#import "UIButton+VerticalLayout.h"
@implementation BannerCell


- (void)awakeFromNib{
    [super awakeFromNib];
    [_verticalButton setVerticalLayoutWithSpace:6];
}


@end
