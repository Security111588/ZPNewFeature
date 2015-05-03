//
//  UIWindow+SLAddition.m
//  SLModelProject
//
//  Created by shicuf on 15/3/3.
//  Copyright (c) 2015年 shicuf. All rights reserved.
//

#import "UIWindow+SLAddition.h"
#import "ViewController.h"
#import "SLNewFeatureViewController.h"

@implementation UIWindow (SLAddition)

- (void)chooseRootViewController
{
    // 判断是否显示新特性
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSLog(@"Current Version : %@", currentVersion);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [defaults objectForKey:@"CFBundleShortVersionString"];
    NSLog(@"Local Version : %@", localVersion);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    if ([currentVersion compare:localVersion] == NSOrderedDescending) {
        SLNewFeatureViewController *newFeatureVC = [[SLNewFeatureViewController alloc] init];
        window.rootViewController = newFeatureVC;
        
        [defaults setObject:currentVersion forKey:@"CFBundleShortVersionString"];
        [defaults synchronize];
//    } else {
//        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        UIViewController *vc = sb.instantiateInitialViewController;
//        window.rootViewController = vc;
//    }
}

@end
