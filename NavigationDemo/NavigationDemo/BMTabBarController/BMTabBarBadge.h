//
//  BMTabBarBadge.h
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMTabBarBadge : UIButton

@property (nonatomic, copy) NSString *badgeValue;

@property (nonatomic, assign) NSInteger tabBarItemCount;

/** Tabbar item's badge title font */
@property (nonatomic, strong) UIFont *badgeTitleFont;

@end
