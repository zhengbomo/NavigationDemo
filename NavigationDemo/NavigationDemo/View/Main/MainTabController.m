//
//  MainTabController.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "MainTabController.h"
#import "MeVC.h"
#import "NavigationController.h"
#import "DiscoverVC.h"

@interface MainTabController ()

@end

@implementation MainTabController

#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc
{
	NSLog(@"%@-释放了",self.class);
}


#pragma mark - Private Method
- (void)reload
{
    for (UIViewController *childVC in self.viewControllers) {
        [childVC removeFromParentViewController];
    }
    
    UIViewController *vc = [[DiscoverVC alloc] init];
    vc.hidesBottomBarWhenPushed = NO;
    NavigationController *navVC1 = [[NavigationController alloc] initWithRootViewController:vc];
    navVC1.tabBarItem.title = @"Discover";
//    [self addChildViewController:navVC1];
    
    vc = [[MeVC alloc] init];
    vc.hidesBottomBarWhenPushed = NO;
    NavigationController *navVC2 = [[NavigationController alloc] initWithRootViewController:vc];
    navVC2.tabBarItem.title = [[[NSUUID UUID] UUIDString] substringToIndex:3];
    [self addChildViewController:navVC2];
    
    self.viewControllers = @[navVC1, navVC2];

    
    //会触发UI更新
    self.selectedIndex = 0;
    
    //TODO: TabBar不更新
    [self.tabBar setNeedsLayout];
    [self.tabBar layoutIfNeeded];
    
}

@end
