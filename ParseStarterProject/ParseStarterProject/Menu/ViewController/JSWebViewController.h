//
//  JSWebViewController.h
//  ParseStarterProject
//
//  Created by Konan on 16/1/12.
//
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <JavaScriptCore/JavaScriptCore.h>
@interface JSWebViewController : UIViewController
@property (nonatomic,copy)NSString *urlStr;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@property (nonatomic, strong, readonly) JSContext *jsContext;
@end
