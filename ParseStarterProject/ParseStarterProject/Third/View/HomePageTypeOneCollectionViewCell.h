//
//  HomePageTypeOneCollectionViewCell.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/10.
//
//

#import <UIKit/UIKit.h>
@class InfoModel;
@interface HomePageTypeOneCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *typeOneImageView;
@property (weak, nonatomic) IBOutlet UILabel *typeOneLabel;
@property (nonatomic,strong)InfoModel *model;
@end
