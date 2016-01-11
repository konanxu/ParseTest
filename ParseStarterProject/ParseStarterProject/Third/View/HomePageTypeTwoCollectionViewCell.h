//
//  HomePageTypeTwoCollectionViewCell.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import <UIKit/UIKit.h>
@class ComicinfoModel;
@interface HomePageTypeTwoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *typeTwoImageView;
@property (weak, nonatomic) IBOutlet UILabel *typeTwoLabel;
@property (nonatomic,strong)ComicinfoModel *model;
@end
