//
//  BMTabBar.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "BMTabBar.h"

@implementation BMTabBar

- (NSMutableArray *)tabBarItems
{    
    if (_tabBarItems == nil) {
        _tabBarItems = [[NSMutableArray alloc] init];
    }
    return _tabBarItems;
}

- (void)addTabBarItem:(UITabBarItem *)item
{
    BMTabBarItem *tabBarItem = [[BMTabBarItem alloc] initWithItemImageRatio:self.itemImageRatio];
    
    tabBarItem.badgeTitleFont         = self.badgeTitleFont;
    tabBarItem.itemTitleFont          = self.itemTitleFont;
    tabBarItem.itemTitleColor         = self.itemTitleColor;
    tabBarItem.selectedItemTitleColor = self.selectedItemTitleColor;
    
    tabBarItem.tabBarItemCount = self.tabBarItemCount;
    
    tabBarItem.tabBarItem = item;
    
    [tabBarItem addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:tabBarItem];
    
    [self.tabBarItems addObject:tabBarItem];
    
    if (self.tabBarItems.count == 1) {
        
        [self buttonClick:tabBarItem];
    }
}

- (void)removeTabBarItem:(UITabBarItem *)item
{
    for (BMTabBarItem *tabBarItem in self.tabBarItems) {
        if (tabBarItem.tabBarItem == item) {
            [tabBarItem removeFromSuperview];
            [self.tabBarItems removeObject:tabBarItem];
            return;
        }
    }
}

- (void)removeAllTabBarItem
{
    for (BMTabBarItem *tabBarItem in self.tabBarItems) {
        [tabBarItem removeFromSuperview];
    }
    [self.tabBarItems removeAllObjects];
}

- (void)buttonClick:(BMTabBarItem *)tabBarItem
{
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedItemFrom:to:)]) {
        [self.delegate tabBar:self didSelectedItemFrom:self.selectedItem.tabBarItem.tag to:tabBarItem.tag];
    }
    self.selectedItem.selected = NO;
    self.selectedItem = tabBarItem;
    self.selectedItem.selected = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    
    int count = (int)self.tabBarItems.count;
    CGFloat itemY = 0;
    CGFloat itemW = w / self.subviews.count;
    CGFloat itemH = h;
    
    for (int index = 0; index < count; index++) {
        BMTabBarItem *tabBarItem = self.tabBarItems[index];
        tabBarItem.tag = index;
        CGFloat itemX = index * itemW;
        tabBarItem.frame = CGRectMake(itemX, itemY, itemW, itemH);
    }
}

@end
