//
//  BMTabBar.h
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMTabBarItem.h"

@class BMTabBar;

@protocol BMTabBarDelegate <NSObject>

@optional
- (void)tabBar:(BMTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface BMTabBar : UIView

/** Tabbar item title color */
@property (nonatomic, strong) UIColor *itemTitleColor;

/** Tabbar selected item title color */
@property (nonatomic, strong) UIColor *selectedItemTitleColor;

/** Tabbar item title font */
@property (nonatomic, strong) UIFont *itemTitleFont;

/** Tabbar item's badge title font */
@property (nonatomic, strong) UIFont *badgeTitleFont;

/** Tabbar item image ratio */
@property (nonatomic, assign) CGFloat itemImageRatio;

@property (nonatomic, assign) NSInteger tabBarItemCount;

@property (nonatomic, strong) BMTabBarItem *selectedItem;

@property (nonatomic, strong) NSMutableArray *tabBarItems;

@property (nonatomic, weak) id<BMTabBarDelegate> delegate;

- (void)addTabBarItem:(UITabBarItem *)item;
- (void)removeTabBarItem:(UITabBarItem *)item;
- (void)removeAllTabBarItem;

@end
