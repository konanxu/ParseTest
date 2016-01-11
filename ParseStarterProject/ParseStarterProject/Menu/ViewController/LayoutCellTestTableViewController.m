//
//  LayoutCellTestTableViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/12/28.
//
//

#import "LayoutCellTestTableViewController.h"
#import "APPModel.h"
#import "CommonManager.h"
#import <MJExtension.h>
#import "LayoutCell.h"
#import <UITableView+FDTemplateLayoutCell.h>
@interface LayoutCellTestTableViewController ()
{
    NSMutableArray *_dataArray;
}
@end

#define kWebPath @"https://itunes.apple.com/cn/rss/newfreeapplications/limit=50/json"

static NSString * const kLayoutCellID = @"LayoutCellIdentifier";

@implementation LayoutCellTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.imgUrl);
    _dataArray =[[NSMutableArray alloc] init];
//    [self.tableView registerClass:[LayoutCell class] forCellReuseIdentifier:kLayoutCellID];
    
#pragma mark - LayoutCell 方案1
    self.tableView.estimatedRowHeight = 80;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    
    
    self.tableView.tableFooterView =[UIView new];
    [[CommonManager shareCommonManager].httpManager GET:kWebPath parameters:nil].then(^(id responseObject,AFHTTPRequestOperation *operation,NSError *error){
        if (error) {
             NSLog(@"%@",error.localizedDescription);
        }else{
            NSArray *arr = responseObject[@"feed"][@"entry"];
             [APPModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
                return @{
                         @"decStr" : @"title.label",
                         @"imgUrl" : @"im:image[2].label",
                         };
            }];
                             _dataArray= [APPModel mj_objectArrayWithKeyValuesArray:arr];
            [self.tableView reloadData];
        }
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

#pragma mark - LayoutCell 方案2

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return [tableView fd_heightForCellWithIdentifier:kLayoutCellID configuration:^(LayoutCell *cell) {
//        // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
//        // Like:
////            cell.entity = self.feedEntities[indexPath.row];
////        cell.model = _dataArray[indexPath.row];
//         cell.fd_enforceFrameLayout = NO;
//    }];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:kLayoutCellID forIndexPath:indexPath];
    
    cell.model = _dataArray[indexPath.row];
//    cell.fd_enforceFrameLayout = YES;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
