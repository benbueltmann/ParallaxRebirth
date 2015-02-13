//
//  AppDelegate.m
//  Parallax
//
//  Created by Ben Bueltmann on 2/12/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "AppDelegate.h"
#import "ParallaxCollectionViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    ParallaxCollectionViewController *viewController = [ParallaxCollectionViewController new];
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}


@end
