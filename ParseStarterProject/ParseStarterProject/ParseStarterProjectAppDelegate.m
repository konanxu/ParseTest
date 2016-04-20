/**
 * Copyright (c) 2015-present, Parse, LLC.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <Parse/Parse.h>

// If you want to use any of the UI components, uncomment this line
// #import <ParseUI/ParseUI.h>

// If you are using Facebook, uncomment this line
// #import <ParseFacebookUtils/PFFacebookUtils.h>

// If you want to use Crash Reporting - uncomment this line
// #import <ParseCrashReporting/ParseCrashReporting.h>

#import "ParseStarterProjectAppDelegate.h"
#import "ParseStarterProjectViewController.h"

#import "MainTabBarController.h"
#import "LoginViewController.h"
#import "LeftSideController.h"
#import "RightSideViewController.h"
#import "HomeViewController.h"
#import <MMDrawerController.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>
#import <PromiseKit-AFNetworking/AFNetworking+PromiseKit.h>
#import <PromiseKit.h>
#import "CommonManager.h"
#import <MJExtension.h>
#import "AdModel.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "NSString+Util.h"
#import <FBMemoryProfiler/FBMemoryProfiler.h>

#import "CacheCleanerPlugin.h"
#import "RetainCycleLoggerPlugin.h"
#define kDefaultSB [UIStoryboard storyboardWithName:@"Main" bundle:nil]

@implementation ParseStarterProjectAppDelegate
{
    BMKMapManager* _mapManager;
    FBMemoryProfiler *_memoryProfiler;
}


#pragma mark -
#pragma mark UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Enable storing and querying data from Local Datastore. Remove this line if you don't want to
    // use Local Datastore features or want to use cachePolicy.
    [Parse enableLocalDatastore];

    // ****************************************************************************
    // Uncomment this line if you want to enable Crash Reporting
    // [ParseCrashReporting enable];
    //
    // Uncomment and fill in with your Parse credentials:
     [Parse setApplicationId:@"f3CstWx3lZ2u42Ezmw7XNPOF963TCsCsFAKCAHgZ" clientKey:@"a0MRg64DU4UX23zqAIxK1jBkJHIgr9HZQXapqAFr"];
    //
    // If you are using Facebook, uncomment and add your FacebookAppID to your bundle's plist as
    // described here: https://developers.facebook.com/docs/getting-started/facebook-sdk-for-ios/
    // [PFFacebookUtils initializeFacebook];
    // ****************************************************************************

    [PFUser enableAutomaticUser];

    PFACL *defaultACL = [PFACL ACL];

    // If you would like all objects to be private by default, remove this line.
    [defaultACL setPublicReadAccess:YES];

    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];

    // Override point for customization after application launch.
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//     self.window.backgroundColor = [UIColor whiteColor];
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];

    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced in iOS 7).
        // In that case, we skip tracking here to avoid double counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                        UIUserNotificationTypeBadge |
                                                        UIUserNotificationTypeSound);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                                 categories:nil];
        [application registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    } else
#endif
    {
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                         UIRemoteNotificationTypeAlert |
                                                         UIRemoteNotificationTypeSound)];
    }

    NSDictionary* remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    NSLog(@"%@",remoteNotification);
//    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ParseStarterProjectViewController alloc] init]];
//    self.window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeNav"];
    
    
#if 0
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"%@",currentUser.username);
    id  i =  [currentUser valueForKeyPath:@"estimatedData"];
    NSDictionary *dic =[i valueForKeyPath:@"dataDictionary"];
    //    currentUser.es
    //    PFObject *ob =    [currentUser valueForKey:@"PFObject"];
    //    ob.
    //    currentUser.
    //    estimatedData
    //    dataDictionary
    
//        [[NSUserDefaults standardUserDefaults] objc];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    if (dic.allKeys.count>0) {
        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabBarController"];
//        tbVc.modalPresentationStyle = UIModalPresentationPopover;
        
        
    } else {
        self.window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
        
    }
#else
//    NSString *str=[[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
//    if (str!=nil) {
//        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabBarController"];
//    }else {
//        self.window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginViewController"];
//        
//    }
#endif
    
    
    
    
    
    [self buildUserInterFace];
//    [self.window makeKeyAndVisible];
    /**
     百度地图
     */
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"p43qAfWv2rx8nkLlEdmNSIkD"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    [self.window makeKeyAndVisible];
    
    _memoryProfiler = [[FBMemoryProfiler alloc] initWithPlugins:@[[CacheCleanerPlugin new],
                                                                  [RetainCycleLoggerPlugin new]]
                               retainCycleDetectorConfiguration:nil];
    [_memoryProfiler enable];
    
    return YES;
}


- (void)buildUserInterFace{
    NSString  *userName = [[NSUserDefaults standardUserDefaults] objectForKey:@"user_name"];
    if (userName!=nil) {
        //        self.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainTabBarController"];
        
        
        [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleLightContent;
        [[CommonManager shareCommonManager].httpManager GET:kAdAdress parameters:nil].then(^(id responseObject,AFHTTPRequestOperation *operation,NSError *error){
            if (error) {
                NSLog(@"%@",error.localizedDescription);
            }else{
//                NSLog(@"res= %@",responseObject);
                NSLog(@"%@",[NSString jsonStringWithDictionary:responseObject]);
                
                
                NSDictionary *dic =responseObject[@"ads"];
                
              NSArray *arr =  [AdModel objectArrayWithKeyValuesArray:dic];
                AdModel *adm =arr[0];
                NSString *imgUrl =adm.res_url[1];
                UIImageView *imagView =[[UIImageView alloc] init];
                [imagView setContentMode:UIViewContentModeScaleAspectFit];
                imagView.backgroundColor =[UIColor whiteColor];
                [imagView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:nil options:SDWebImageLowPriority|SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                    
                    imagView.alpha=0;
                    
                    [UIView animateWithDuration:0.5 animations:^{
                        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:imagView];
                        imagView.alpha =1;
                    }];
                    
//                    CGAffineTransform  transform;
//                    transform = CGAffineTransformScale(imagView.transform,1.0,1.5);
//                    [UIView beginAnimations:@"scale" context:nil];
//                    [UIView setAnimationDuration:2];
//                    [UIView setAnimationDelegate:self];
//                    [imagView setTransform:transform];
//                    [UIView commitAnimations];
                    
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [UIView animateWithDuration:1 animations:^{
                            imagView.alpha =0;
                            imagView.transform =CGAffineTransformMakeScale(1.2,1.2);
                            [UIApplication sharedApplication].statusBarStyle =UIStatusBarStyleDefault;
                        } completion:^(BOOL finished) {
                            [imagView removeFromSuperview];
//                            [UIApplication sharedApplication] .statusBarHidden =NO;
                            
                        }];
                        
                        
                    });
                }];
                
                [[UIApplication sharedApplication].keyWindow addSubview:imagView];
                
                [imagView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.width.mas_equalTo(imagView.superview.width);
                    make.height.mas_equalTo(imagView.superview.height);
                }];
                
                
                self.window.backgroundColor =[UIColor whiteColor];
                [self loginBuild];
            }
        });
        
        
        

        
    }else{
        self.window.rootViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginNewViewController"];
    }
}
- (void)loginBuild{
    MainTabBarController *homeVc =[kDefaultSB instantiateViewControllerWithIdentifier:@"MainTabBarController"];
    
    RightSideViewController *rightVc =[kDefaultSB instantiateViewControllerWithIdentifier:@"RightSideViewController"];
    
    LeftSideController *leftVc = [kDefaultSB instantiateViewControllerWithIdentifier:@"LeftSideController"];
    
    //        UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    UINavigationController *rightNav = [[UINavigationController alloc] initWithRootViewController:rightVc];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:leftVc];
    _drawerContainer =[[MMDrawerController alloc] initWithCenterViewController:homeVc leftDrawerViewController:leftNav rightDrawerViewController:rightNav];
    _drawerContainer.openDrawerGestureModeMask =MMOpenDrawerGestureModeBezelPanningCenterView;
    _drawerContainer.closeDrawerGestureModeMask =MMCloseDrawerGestureModePanningCenterView;
    self.window.rootViewController =_drawerContainer;
}
#pragma mark Push Notifications

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"%s",__FUNCTION__);
    NSLog(@"%@",deviceToken);
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];

    [PFPush subscribeToChannelInBackground:@"" block:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
        } else {
            NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
        }
    }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    if (error.code == 3010) {
        NSLog(@"Push notifications are not supported in the iOS Simulator.");
    } else {
        // show some alert or otherwise handle the failure to register.
        NSLog(@"application:didFailToRegisterForRemoteNotificationsWithError: %@", error);
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    NSLog(@"userinfo:%@",userInfo);
    [PFPush handlePush:userInfo];

    if (application.applicationState == UIApplicationStateInactive) {
        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
    }
}

///////////////////////////////////////////////////////////
// Uncomment this method if you want to use Push Notifications with Background App Refresh
///////////////////////////////////////////////////////////
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    if (application.applicationState == UIApplicationStateInactive) {
//        [PFAnalytics trackAppOpenedWithRemoteNotificationPayload:userInfo];
//    }
//}

#pragma mark Facebook SDK Integration

///////////////////////////////////////////////////////////
// Uncomment this method if you are using Facebook
///////////////////////////////////////////////////////////
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//  sourceApplication:(NSString *)sourceApplication
//         annotation:(id)annotation {
//    return [PFFacebookUtils handleOpenURL:url];
//}
- (BOOL)application:(UIApplication *)application shouldAllowExtensionPointIdentifier:(NSString *)extensionPointIdentifier
{
    return NO;
}
@end
