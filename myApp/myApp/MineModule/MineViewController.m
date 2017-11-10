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
@property (nonatomic,copy) NSArray *titleArr;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _titleArr = @[@"消息",@"设置",@"关于我们",@"版本号",];
    [self.view addSubview:self.mineTableView];
}

- (UITableView *)mineTableView{
    if(!_mineTableView){
        _mineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 49) style:UITableViewStylePlain];
        _mineTableView.rowHeight = 40*kScale;
        _mineTableView.tableHeaderView = self.tableHeaderView;
        _mineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mineTableView.delegate = self;
        _mineTableView.dataSource = self;
    }
    return _mineTableView;
}

- (NSInteger)naviAndTabState{
    return 2;
}

#pragma mark -delegate Tableview

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
    cell.textLabel.text = _titleArr[indexPath.row];
    return cell;
}

@end
