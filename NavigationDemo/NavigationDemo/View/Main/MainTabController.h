//
//  MainTabController.h
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "BMTabBarController.h"
#import "ReloadProtocal.h"

@interface MainTabController : BMTabBarController <ReloadProtocal>

- (void)reload;

@end
