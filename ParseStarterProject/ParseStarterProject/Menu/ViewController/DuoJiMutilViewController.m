//
//  DuoJiMutilViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/20.
//
//

#import "DuoJiMutilViewController.h"
#import "DuoJiSubViewController.h"
@interface DuoJiMutilViewController()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray * _mainDatasourceArray;
    NSArray *_subVCDataSourceArray;
    DuoJiSubViewController *_subVc;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
@implementation DuoJiMutilViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    _mainDatasourceArray =@[@"我的",@"你的",@"他的"];
    
    _subVCDataSourceArray =@[@[@"1",@"2",@"3"],@[@"4",@"5",@"6"],@[@"7",@"8",@"9"]];
    
    _myTableView.tableFooterView=[UIView new];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSString *str = segue.identifier;
    if([segue.identifier isEqualToString:@"embedSubMenu"]){
        _subVc = segue.destinationViewController;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text =_mainDatasourceArray[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _mainDatasourceArray.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DuoJiSubViewController *vc = _subVc;
    if (vc) {
        vc.subDataArray =_subVCDataSourceArray[indexPath.row];
    }
}
@end
