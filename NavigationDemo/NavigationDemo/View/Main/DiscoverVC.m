//
//  DiscoverVC.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "DiscoverVC.h"
#import "SettingVC.h"
#import "MainTabController.h"
#import "AppDelegate.h"
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface DiscoverVC ()

@property (nonatomic, strong) UILabel *unameLabel;

@end

@implementation DiscoverVC

#pragma mark - Life Cycle
- (void)loadView
{
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Test" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
    
    self.unameLabel = [[UILabel alloc] init];
    [self.view addSubview:self.unameLabel];
    [self.unameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SVProgressHUD showWithStatus:@"正在初始化数据"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.unameLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"User"];
        
        [SVProgressHUD showSuccessWithStatus:@"加载完成"];
        [SVProgressHUD dismissWithDelay:0.5];
    });
}


#pragma mark - Private Method
- (void)setting
{
    UIViewController *vc = [[SettingVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)test
{
    MainTabController *tabVC = (MainTabController *)self.navigationController.tabBarController;
    [tabVC reload];
    
}
@end
