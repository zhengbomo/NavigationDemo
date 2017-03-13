//
//  BMTabBarController.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "BMTabBarController.h"
#import "BMTabBar.h"

@interface BMTabBarController () <BMTabBarDelegate>

@property (nonatomic, strong) BMTabBar *bmTabBar;

@end

@implementation BMTabBarController

#pragma mark -

- (UIColor *)itemTitleColor {
    
    if (!_itemTitleColor) {
        
        _itemTitleColor = [UIColor colorWithRed:117.0/255.0 green:117.0/255.0 blue:117.0/255.0 alpha:1];
    }
    return _itemTitleColor;
}

- (UIColor *)selectedItemTitleColor {
    
    if (!_selectedItemTitleColor) {
        
        _selectedItemTitleColor = [UIColor colorWithRed:234.0/255.0 green:103.0/255.0 blue:7.0/255.0 alpha:1];
    }
    return _selectedItemTitleColor;
}

- (UIFont *)itemTitleFont {
    if (!_itemTitleFont) {        
        _itemTitleFont = [UIFont systemFontOfSize:10.0f];
    }
    return _itemTitleFont;
}

- (UIFont *)badgeTitleFont {
    
    if (!_badgeTitleFont) {
        _badgeTitleFont = [UIFont systemFontOfSize:11.0f];
    }
    return _badgeTitleFont;
}

#pragma mark -

- (void)loadView
{
    [super loadView];
    self.itemImageRatio = 0.70f;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBar addSubview:({
        BMTabBar *tabBar = [[BMTabBar alloc] init];
        tabBar.frame     = self.tabBar.bounds;
        tabBar.delegate  = self;
        self.bmTabBar = tabBar;
    })];
}

- (void)removeOriginControls
{
    [self.tabBar.subviews enumerateObjectsUsingBlock:^(__kindof UIView * obj, NSUInteger idx, BOOL * stop) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    [self.bmTabBar removeAllTabBarItem];
    
    self.bmTabBar.badgeTitleFont         = self.badgeTitleFont;
    self.bmTabBar.itemTitleFont          = self.itemTitleFont;
    self.bmTabBar.itemImageRatio         = self.itemImageRatio;
    self.bmTabBar.itemTitleColor         = self.itemTitleColor;
    self.bmTabBar.selectedItemTitleColor = self.selectedItemTitleColor;
    self.bmTabBar.tabBarItemCount = viewControllers.count;
    [viewControllers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIViewController *VC = (UIViewController *)obj;
        UIImage *selectedImage = VC.tabBarItem.selectedImage;
        VC.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        [self addChildViewController:VC];
        [self.bmTabBar addTabBarItem:VC.tabBarItem];
    }];
    
    [self removeOriginControls];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    
    self.bmTabBar.selectedItem.selected = NO;
    self.bmTabBar.selectedItem = self.bmTabBar.tabBarItems[selectedIndex];
    self.bmTabBar.selectedItem.selected = YES;
}

#pragma mark - BMTabBarDelegate Method
- (void)tabBar:(BMTabBar *)tabBarView didSelectedItemFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
}

@end
