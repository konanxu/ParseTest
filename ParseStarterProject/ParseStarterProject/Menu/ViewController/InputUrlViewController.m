//
//  InputUrlViewController.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/12.
//
//

#import "InputUrlViewController.h"
#import "JSWebViewController.h"

@interface InputUrlViewController ()<UIGestureRecognizerDelegate>

@end

@implementation InputUrlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myTextField.text= @"http://www.zyczone.com/hybird/storage.html";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    [self.myTextField resignFirstResponder];
    UIAlertView *aler =[[UIAlertView alloc] initWithTitle:@"dsa" message:@"dsd" delegate:self cancelButtonTitle:@"dd" otherButtonTitles:@"asd", nil];
    [aler show];
    return YES;
}

- (IBAction)commit:(id)sender {
    
    [self performSegueWithIdentifier:@"FromJSWebIdentifier" sender:@{@"urlStr":self.myTextField.text}];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    JSWebViewController *vc = segue.destinationViewController;
    vc.urlStr = sender[@"urlStr"];
    vc.hidesBottomBarWhenPushed = YES;
}

@end
