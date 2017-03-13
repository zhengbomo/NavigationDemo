//
//  NavigationController.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
	NSLog(@"%@-释放了",self.class);
}


#pragma mark - Public Method
- (UITabBarController *)tabBarVC
{
    UIViewController *vc = self.parentViewController;
    while (vc != nil && ![vc isKindOfClass:[UITabBarController class]]) {
        vc = vc.parentViewController;
    }
    return (UITabBarController *)vc;
}

#pragma mark - Private Method

@end
