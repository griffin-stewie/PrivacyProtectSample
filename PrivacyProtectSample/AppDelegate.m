//
//  AppDelegate.m
//  PrivacyProtectSample
//
//  Created by griffin_stewie on 2013/10/08.
//  Copyright (c) 2013年 cyan-stivy.net. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+BlurEffects.h"

@interface AppDelegate ( )
@property (nonatomic, strong) UIView *privacyView;
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    [self showBluredPrivacyWindow];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if ([self.privacyView superview]) {
        return;
    }
    [self showBluredPrivacyWindow];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self removeBluredPrivacyWindow];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self removeBluredPrivacyWindow];
}

#pragma mark -
#pragma mark Privacy

- (UIView *)privacyView
{
    if (_privacyView == nil) {
        _privacyView = [[UIView alloc] initWithFrame:self.window.frame];
//        _privacyView.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.95];
        _privacyView.opaque = YES;
    }
    return _privacyView;
}

- (void)showBluredPrivacyWindow
{
    self.privacyView.backgroundColor = [UIColor colorWithPatternImage:[self.window blurredSnapshotWithBlurType:BlurEffectsTypeLight]];
    [self.window addSubview:self.privacyView];
}

- (void)removeBluredPrivacyWindow
{
    [self.privacyView removeFromSuperview];
}
@end
