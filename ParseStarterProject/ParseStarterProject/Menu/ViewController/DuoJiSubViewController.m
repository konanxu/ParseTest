//
//  DuoJiSubViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/20.
//
//

#import "DuoJiSubViewController.h"
#import <KVOController/FBKVOController.h>
@interface DuoJiSubViewController()<UITableViewDelegate,UITableViewDataSource>
{
    
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@end
@implementation DuoJiSubViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    _myTableView.tableFooterView =[UIView new];
    
    FBKVOController *KVOController = [FBKVOController controllerWithObserver:self];
    self.KVOController = KVOController;
    
    [self.KVOController observe:self keyPath:@"subDataArray" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        NSLog(@"调用");
        [_myTableView reloadData];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text =self.subDataArray[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.subDataArray.count;
}


@end
