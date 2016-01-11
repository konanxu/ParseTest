//
//  XiaLaFangDaViewController.m
//  ParseStarterProject
//
//  Created by Konan on 15/10/21.
//
//

#import "XiaLaFangDaViewController.h"

@interface XiaLaFangDaViewController()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftContract;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightContract;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topContract;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spaceContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightContraint;

@end
@implementation XiaLaFangDaViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint p = scrollView.contentOffset;
    NSLog(@"[%f,%f]",p.x,p.y);
    if(p.y<0){
        _heightContraint.constant=150-p.y;
        _widthContraint.constant =320-p.y;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
@end
