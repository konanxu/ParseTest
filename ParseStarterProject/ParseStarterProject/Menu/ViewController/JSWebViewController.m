//
//  JSWebViewController.m
//  ParseStarterProject
//
//  Created by Konan on 16/1/12.
//
//

#import "JSWebViewController.h"
#import "LocalStorageController.h"
@interface JSWebViewController ()<UIWebViewDelegate>

@end

@implementation JSWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLRequest *request =[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]];
    [self.myWebView loadRequest:request];
    
//    [self.myWebView setHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
//    NSString *jsString = @"localStorage.getItem('username');";
//    NSString *someKeyValue = [myTapView stringByEvaluatingJavaScriptFromString:jsString];
//    
//    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
//    [userdefault setObject:someKeyValue forKey:@"username"];
//    [userdefault synchronize];
//    
//    //use of User default
//    NSLog(@"User name %@",[userdefault valueForKey:@"username"]);
    NSString *str = [webView stringByEvaluatingJavaScriptFromString:@"localStorage.getItem('username');"];
    NSLog(@"%@",str);
    
    LocalStorageController *vc =[[LocalStorageController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    if (_jsContext == nil) {
        _jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
        _jsContext[@"openWebPage"] = ^(NSString *param) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:param]];
        };
        _jsContext[@"openWebPage"] = ^(NSString *param) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:param]];
        };
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
