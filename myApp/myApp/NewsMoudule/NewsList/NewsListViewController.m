//
//  NewsListViewController.m
//  myApp
//
//  Created by guest on 2018/10/25.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "NewsListViewController.h"

@interface NewsListViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *newsListTableView;
@end

@implementation NewsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableView代理方法

@end
