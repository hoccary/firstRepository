//
//  AlarmListViewController.m
//  myApp
//
//  Created by guest on 2018/10/25.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListViewController.h"
#import "AlarmListNormalCell.h"
#import "AlarmListModel.h"

@interface AlarmListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *alarmListTableView;
@property (nonatomic, strong) NSMutableArray *modelList;
@end

static NSString *const AlarmListTableViewCellId = @"AlarmListTableViewCell";

@implementation AlarmListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initModelList];
    [self.view addSubview:self.alarmListTableView];
}

- (void)initModelList{
    AlarmListModel *model = [[AlarmListModel alloc] initWithDic:@{@"alartTime":@"08:30",
                                                                  @"alartWeekdays":@[@0,@1,@0,@0,@0,@0,@0],
                                                                  @"isValidate":@1
                                                                  }];
    _modelList = @[model];
}

#pragma mark - tableView代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _modelList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AlarmListTableViewCell *cell = [_alarmListTableView dequeueReusableCellWithIdentifier:AlarmListTableViewCellId];
//    AlarmListTableViewCell *cell = [AlarmListTableViewCell cellWithType:AlarmListTableViewCellTypeNormal];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupWithModel:_modelList[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CellHeightForAlarmList;
}

#pragma mark - Lazy Load
-(UITableView *)alarmListTableView{
    if(!_alarmListTableView){
        _alarmListTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        _alarmListTableView.backgroundColor = UIColor.purpleColor;
        _alarmListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _alarmListTableView.delegate = self;
        _alarmListTableView.dataSource = self;
        [_alarmListTableView registerClass:[AlarmListTableViewCell class] forCellReuseIdentifier:AlarmListTableViewCellId];
//        [_alarmListTableView registerNib:[UINib nibWithNibName:@"AlarmListNormalCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:AlarmListTableViewCellId];
    }
    return _alarmListTableView;
}
@end
