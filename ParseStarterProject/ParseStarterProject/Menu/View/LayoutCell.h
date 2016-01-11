//
//  LayoutCell.h
//  ParseStarterProject
//
//  Created by Konan on 15/12/28.
//
//

#import <UIKit/UIKit.h>
#import "APPModel.h"
@interface LayoutCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *decLabel;

@property (strong,nonatomic)APPModel *model;
@end
