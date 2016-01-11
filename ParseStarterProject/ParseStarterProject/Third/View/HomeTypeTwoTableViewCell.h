//
//  HomeTypeTwoTableViewCell.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import <UIKit/UIKit.h>
@class ListItemModel;
@interface HomeTypeTwoTableViewCell : UITableViewCell<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@property (nonatomic,strong)ListItemModel *model;
@end
