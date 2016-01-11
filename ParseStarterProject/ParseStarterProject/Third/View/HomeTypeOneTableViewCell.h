//
//  HomeTypeOneTableViewCell.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/11.
//
//

#import <UIKit/UIKit.h>
@class ListItemModel;
@interface HomeTypeOneTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,strong)ListItemModel *model;
@end
