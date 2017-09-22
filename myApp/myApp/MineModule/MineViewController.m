//
//  MineViewController.m
//  myApp
//
//  Created by 张东伟 on 17/9/22.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *mineTableView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UITableView *)mineTableView{
    if(!_mineTableView){
        _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, kScale, kScreenHeight - 200) style:UITableViewStylePlain];
        _mineTableView.delegate = self;
    }
    return _mineTableView;
}

- (NSInteger)naviAndTabState{
    return 2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
