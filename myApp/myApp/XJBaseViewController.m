//
//  XJBaseViewController.m
//  myApp
//
//  Created by 张东伟 on 17/8/27.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "XJBaseViewController.h"

@interface XJBaseViewController ()

@end

@implementation XJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviBackArrow"] style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.leftBarButtonItem = backBtn;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)naviAndTabState{
    return 3;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    switch ([self naviAndTabState]) {
        case 0:
            self.navigationController.navigationBarHidden = YES;
            self.tabBarController.tabBar.hidden = YES;
            break;
        case 1:
            self.navigationController.navigationBarHidden = NO;
            self.tabBarController.tabBar.hidden = YES;
            break;
        case 2:
            self.navigationController.navigationBarHidden = YES;
            self.tabBarController.tabBar.hidden = NO;
            break;
        case 3:
            self.navigationController.navigationBarHidden = NO;
            self.tabBarController.tabBar.hidden = NO;
            break;
        default:
            break;
    }
}

@end
