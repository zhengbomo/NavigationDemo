//
//  SettingVC.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "SettingVC.h"
#import "ReloadProtocal.h"
#import "LoginVC.h"
#import <Masonry/Masonry.h>
#import "NavigationController.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface SettingVC ()

@end

@implementation SettingVC

#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Logout" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    [btn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Method
- (void)logout
{
    [SVProgressHUD showWithStatus:@"正在注销"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"User"];

        [SVProgressHUD dismiss];
        
        LoginVC *loginVC = [[LoginVC alloc] init];
        NavigationController *navVC = [[NavigationController alloc] initWithRootViewController:loginVC];
        
        [self.tabBarController presentViewController:navVC animated:YES completion:^{
            //清理数据
            NavigationController *rootNavVC = (NavigationController *)self.navigationController;
            UITabBarController *tabVC = rootNavVC.tabBarVC;
            
            [self.navigationController popToRootViewControllerAnimated:NO];
            if ([tabVC conformsToProtocol:@protocol(ReloadProtocal)]) {
                id<ReloadProtocal> reloadVC = (id<ReloadProtocal>)tabVC;
                [reloadVC reload];
            }
            
            
        }];
        
    });
    
}

@end
