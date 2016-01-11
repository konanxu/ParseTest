//
//  MessageTableViewController.h
//  ParseStarterProject
//
//  Created by Konan on 15/10/13.
//
//

#import "BaseTableViewController.h"
#import <DZNSegmentedControl/DZNSegmentedControl.h>
@interface MessageTableViewController : BaseTableViewController


@property (weak, nonatomic) IBOutlet DZNSegmentedControl *segmentView;


@end
