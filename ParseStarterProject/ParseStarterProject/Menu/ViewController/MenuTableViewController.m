//
//  MenuTableViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/16.
//
//

#import "MenuTableViewController.h"
#import "ChuanGanQiController.h"
#import "DuoJiCaiDanController.h"
#import "XiaLaFangDaViewController.h"
#import "AutoLayoutTestViewController.h"
#import "IntroduceAnimationViewComtroller.h"
#import "ImageTestViewController.h"
#import "OHHttpTestViewController.h"
#import "LayoutCellTestTableViewController.h"
#import "InputUrlViewController.h"
#import "StakViewViewController.h"
typedef NS_ENUM(NSInteger, cellType) {
    //传感器
    ChuanGanQi =0,
    DuoJiCaiDan ,
    XiaLaFangDa,
    AutoTest,
    ImageTest,
    OHHttp,
    LayoutCell,
    JSWeb,
    Stack
};
@interface MenuTableViewController()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_dataArray;
    NSString *_urlStr;
}
@end


@implementation MenuTableViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self showHeaderGifWithState:YES];
    _dataArray =@[@"传感器",@"多级菜单",@"下拉图片放大",@"AutoLayerout",@"imageTest",@"OHHttpTest",@"LayoutCell",@"JSWeb",@"StackView"];
    NSString *str= [NSString stringWithFormat:@"123"];
    NSLog(@"%@",str);
   _urlStr = @"http://is4.mzstatic.com/image/thumb/Purple2/v4/4a/cd/70/4acd708b-765e-ed60-4f28-25e23bbcd9ea/pr_source.png/75x75bb-85.png";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text=_dataArray[indexPath.row];
    
    
    
    return cell;
    
    
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case ChuanGanQi:{
            NSLog(@"传感器");
            ChuanGanQiController *cVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ChuanGanQiController"];
            [cVc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:cVc animated:YES];
            
        }
            break;
        case DuoJiCaiDan:{
            DuoJiCaiDanController *duoji = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DuoJiCaiDanController"];
            [duoji setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:duoji animated:YES];
            
        }
            break;
         case XiaLaFangDa:{
            XiaLaFangDaViewController *xiala =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"XiaLaFangDaViewController"];
             [xiala setHidesBottomBarWhenPushed:YES];
             [self.navigationController pushViewController:xiala animated:YES];
        }
            break;
        case AutoTest:{
//            AutoLayoutTestViewController *vc =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AutoLayoutTestViewController"];
//            [vc setHidesBottomBarWhenPushed:YES];
//            [self.navigationController pushViewController:vc animated:YES];
            IntroduceAnimationViewComtroller *vc =[[IntroduceAnimationViewComtroller alloc] init];
            [vc setHidesBottomBarWhenPushed:YES];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        case ImageTest:{
            ImageTestViewController *vc = [[ImageTestViewController alloc] init];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case OHHttp:{
            OHHttpTestViewController *vc =[[OHHttpTestViewController alloc] init];
            [vc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:vc animated:YES];
        }
        case LayoutCell:{
            //尝试用segue来push
            [self performSegueWithIdentifier:@"FromLayoutCellIdentifier" sender:@{@"imageURL":_urlStr}];
        }
            break;
        case JSWeb:{
            [self performSegueWithIdentifier:@"FromInputUrldentifier" sender:nil];
        }
        
            break;
        case Stack:{
            [self performSegueWithIdentifier:@"FromStakdentifier" sender:nil];
        }
            
            break;
        default:{

            
        }
            break;
        
    }
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"FromLayoutCellIdentifier"]) {
        NSDictionary *senderDictionary = sender;
        LayoutCellTestTableViewController *detailTableViewController = segue.destinationViewController;
        detailTableViewController.hidesBottomBarWhenPushed = YES;
        detailTableViewController.imgUrl = senderDictionary[@"imageURL"];
    }
    if ([segue.identifier isEqualToString:@"FromInputUrldentifier"]) {
        InputUrlViewController *vc= segue.destinationViewController;
        vc.hidesBottomBarWhenPushed = YES;
    }
    if ([segue.identifier isEqualToString:@"FromStakdentifier"]) {
        StakViewViewController *vc= segue.destinationViewController;
        vc.hidesBottomBarWhenPushed = YES;
    }
}

@end
