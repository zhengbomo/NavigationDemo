//
//  NavigationController.h
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <RTRootNavigationController/RTRootNavigationController.h>

@interface NavigationController : RTRootNavigationController


/** 外层tabBarVC（由于底层实现使用了两层NavigationVC，这里封装一下实现） */
@property (nonatomic, weak, readonly) UITabBarController *tabBarVC;

@end
