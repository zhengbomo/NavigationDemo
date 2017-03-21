//
//  BMTabBarController.h
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMTabBarController : UITabBarController

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

/** tabbar backgroundColor */
@property (nonatomic, strong) UIColor *tabBarBackgroundColor;

/** Remove origin controls, for `- popToRootViewController` */
- (void)removeOriginControls;

@end
