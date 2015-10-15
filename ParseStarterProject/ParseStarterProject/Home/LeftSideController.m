//
//  LeftSideController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/15.
//
//

#import "LeftSideController.h"

@interface LeftSideController()<UITableViewDataSource>
{
    NSArray * _array;
}
@end

@implementation LeftSideController

- (void)viewDidLoad{
    [super viewDidLoad];
    _array = @[@"菜单",@"关于",@"退出"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}

@end
