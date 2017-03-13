//
//  ViewController.m
//  NavigationDemo
//
//  Created by bomo on 2017/3/11.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Cycle
- (instancetype)init
{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)loadView
{
    [super loadView];
    
    self.navigationItem.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)dealloc {
	NSLog(@"%@-释放了",self.class);
}


#pragma mark - Private Method

@end
