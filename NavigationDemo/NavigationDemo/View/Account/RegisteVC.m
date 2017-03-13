//
//  RegisteVC.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "RegisteVC.h"
#import "LoginVC.h"
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface RegisteVC ()

@property (nonatomic, strong) UITextField *unameTf;
@property (nonatomic, strong) UITextField *pwdTf;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *registeBtn;

@end

@implementation RegisteVC
- (void)loadView
{
    [super loadView];
    
    self.unameTf = [[UITextField alloc] init];
    self.unameTf.borderStyle = UITextBorderStyleRoundedRect;
    self.unameTf.placeholder = @"请输入用户名";
    self.unameTf.text = @"bomo";
    [self.view addSubview:self.unameTf];
    [self.unameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(12);
        make.left.equalTo(self.view).offset(8);
        make.right.equalTo(self.view).offset(-8);
    }];
    
    self.pwdTf = [[UITextField alloc] init];
    self.pwdTf.borderStyle = UITextBorderStyleRoundedRect;
    self.pwdTf.secureTextEntry = YES;
    self.pwdTf.text = @"111111";
    self.pwdTf.placeholder = @"请输入密码";
    [self.view addSubview:self.pwdTf];
    [self.pwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.unameTf.mas_bottom).offset(12);
        make.left.equalTo(self.view).offset(8);
        make.right.equalTo(self.view).offset(-8);
    }];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTf.mas_bottom).offset(12);
        make.left.equalTo(self.view).offset(8);
    }];
    
    self.registeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.registeBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registeBtn addTarget:self action:@selector(registe) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registeBtn];
    [self.registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.pwdTf.mas_bottom).offset(12);
        make.right.equalTo(self.view).offset(-8);
    }];
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Private Method
- (void)login
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registe
{
    [SVProgressHUD showWithStatus:@"正在注册"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //TODO：直接登录
        [[NSUserDefaults standardUserDefaults] setValue:self.unameTf.text forKey:@"User"];
        
        [SVProgressHUD dismiss];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    });
}

@end
