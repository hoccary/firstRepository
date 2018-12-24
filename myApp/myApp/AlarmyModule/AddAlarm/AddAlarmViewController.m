//
//  AddAlarmViewController.m
//  myApp
//
//  Created by Zhang on 2018/11/27.
//  Copyright © 2018 张东伟. All rights reserved.
//
/*
 添加闹钟设置页面

 */
#import "AddAlarmViewController.h"
#import "AddAlarmViewModel.h"
#import "AlarmListModel.h"
@interface AddAlarmViewController () <UITableViewDelegate, UITableViewDataSource>
//views
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIView *repeatView;
@property (weak, nonatomic) IBOutlet UIView *soundView;
@property (weak, nonatomic) IBOutlet UIView *extraView;
//XIB控件
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *repeatSelecter;
@property (weak, nonatomic) IBOutlet UILabel *soundSelecter;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UILabel *isShockBtn;
@property (weak, nonatomic) IBOutlet UILabel *sneapySelecter;
@property (weak, nonatomic) IBOutlet UITextField *commentTextfield;
//代码控件
@property (strong, nonatomic) UITableView *selectWeekdaysTabelView;

//按钮
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;
//数据
@property (strong, nonatomic) AlarmListModel *AlarmModel;
@property (strong, nonatomic) NSMutableArray *tmpWeekdaysArr;

@end

@implementation AddAlarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _AlarmModel = [[AlarmListModel alloc] initWithDic:@{
                   @"alarmType": @1,
                   @"alartTime": @"08:30",
                   @"alartWeekdays": @[@0, @0, @0, @0, @0, @0, @0],
                   @"ringTuneName": @"",
                   @"volume": @1,
                   @"isShock": @0,
                   @"sneapTime": @0,
                   @"isValidate": @1,
                   @"remark": @"",
    }];
    [self setViewActions];
}

- (void)setViewActions
{
    [_isShockBtn setViewActionWithBlock:^{
        if (_AlarmModel.isShock == 0) {
            _AlarmModel.isShock = 1;
            _isShockBtn.text = @"😱";
        } else {
            _AlarmModel.isShock = 0;
            _isShockBtn.text = @"🙃";
        }
    }];

    [_sneapySelecter setViewActionWithBlock:^{
        
    }];

    [_soundSelecter setViewActionWithBlock:^{
    }];

    [_repeatSelecter setViewActionWithBlock:^{
        [self.view addSubview:self.selectWeekdaysTabelView];
        [self.selectWeekdaysTabelView dw_popup];
        
    }];
}

//时间选择器时间变化
- (IBAction)timePickerValueChanged:(id)sender
{
    _AlarmModel.alartTime = [CommonFunction convertDateToString:_timePicker.date];
}

//音量slider变化
- (IBAction)volumeSliderValueChanged:(id)sender
{
    _AlarmModel.volume = (NSInteger)_volumeSlider.value;
}

//textfiled编辑结束
- (IBAction)commentTFEditingDidEnd:(id)sender
{
    _AlarmModel.remark = _commentTextfield.text;
}

- (IBAction)complete:(id)sender
{
    //some code
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - LazyLoad
- (UITableView *)selectWeekdaysTabelView
{
    if (!_selectWeekdaysTabelView) {
        //只有当列表出现时才初始化arr
        _tmpWeekdaysArr = [NSMutableArray arrayWithArray:@[@0, @0, @0, @0, @0, @0, @0]];
        
        _selectWeekdaysTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 100, 380)];
        _selectWeekdaysTabelView.center = self.view.center;
        _selectWeekdaysTabelView.delegate = self;
        _selectWeekdaysTabelView.dataSource = self;
        _selectWeekdaysTabelView.rowHeight = 40;
        _selectWeekdaysTabelView.scrollEnabled = NO;
        [_selectWeekdaysTabelView makeCornerWithColor:UIColor.blueColor andRadius:10];

        
        /* headerView */
        //设置headerview，左边是工作日，右边是周末
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _selectWeekdaysTabelView.bounds.size.width, 50)];
        UILabel *weekdaysBtn = [UILabel new];
        weekdaysBtn.frame = CGRectMake(5, 5, headerView.frame.size.width / 2 - 10, headerView.frame.size.height - 10);
        weekdaysBtn.text = @"工作日";
        weekdaysBtn.textAlignment = NSTextAlignmentCenter;
        weekdaysBtn.userInteractionEnabled = YES;
        [weekdaysBtn setViewActionWithBlock:^{
            if([[_tmpWeekdaysArr subarrayWithRange:NSMakeRange(1, 5)] containsObject:@0]){
                for (int i = 1; i != 6; i++) {
                    self.tmpWeekdaysArr[i] = @1;
                }
                [_selectWeekdaysTabelView reloadData];
            }else{
                for (int i = 1; i != 6; i++) {
                    self.tmpWeekdaysArr[i] = @0;
                }
                [_selectWeekdaysTabelView reloadData];
            }
        }];

        UILabel *weekendsBtn = [UILabel new];
        weekendsBtn.text = @"周末";
        weekendsBtn.frame = CGRectMake(headerView.frame.size.width / 2 + 5, 5, headerView.frame.size.width / 2 - 10, headerView.frame.size.height - 10);
        weekendsBtn.textAlignment = NSTextAlignmentCenter;
        weekendsBtn.userInteractionEnabled = YES;
        [weekendsBtn setViewActionWithBlock:^{
            if([_tmpWeekdaysArr[0] integerValue] == 0 || [_tmpWeekdaysArr[6] integerValue] == 0){
                _tmpWeekdaysArr[0] = @1;
                _tmpWeekdaysArr[6] = @1;
                [_selectWeekdaysTabelView reloadData];
            }else{
                _tmpWeekdaysArr[0] = @0;
                _tmpWeekdaysArr[6] = @0;
                [_selectWeekdaysTabelView reloadData];
            }
        }];

        [headerView addSubview:weekdaysBtn];
        [headerView addSubview:weekendsBtn];
        _selectWeekdaysTabelView.tableHeaderView = headerView;
        
        
        /* footerView
         * 左边是取消 右边是确定
         */
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _selectWeekdaysTabelView.bounds.size.width, 50)];
        UILabel *footCancelBtn = [UILabel new];
        footCancelBtn.frame = CGRectMake(5, 5, footerView.frame.size.width / 2 - 10, footerView.frame.size.height - 10);
        footCancelBtn.text = @"取消";
        footCancelBtn.textAlignment = NSTextAlignmentCenter;
        footCancelBtn.userInteractionEnabled = YES;
        [footCancelBtn setViewActionWithBlock:^{
            [_selectWeekdaysTabelView dw_shadeOff];
        }];
        
        UILabel *footSureBtn = [UILabel new];
        footSureBtn.text = @"确定";
        footSureBtn.frame = CGRectMake(footerView.frame.size.width / 2 + 5, 5, footerView.frame.size.width / 2 - 10, footerView.frame.size.height - 10);
        footSureBtn.textAlignment = NSTextAlignmentCenter;
        footSureBtn.userInteractionEnabled = YES;
        [footSureBtn setViewActionWithBlock:^{
            [_selectWeekdaysTabelView dw_shadeOff];
        }];
        
        [footerView addSubview:footCancelBtn];
        [footerView addSubview:footSureBtn];
        _selectWeekdaysTabelView.tableFooterView = footerView;
        
        _selectWeekdaysTabelView.backgroundColor = UIColor.purpleColor;
    }
    return _selectWeekdaysTabelView;
}

#pragma mark - Delegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"weekdaysCell"];
    cell.textLabel.text = @[@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六"][indexPath.row];
    cell.detailTextLabel.text = [self.tmpWeekdaysArr[indexPath.row] integerValue] == 1 ?@"✓": @"";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _tmpWeekdaysArr[indexPath.row] = [_tmpWeekdaysArr[indexPath.row] integerValue] == 1? @0:@1;
    [_selectWeekdaysTabelView reloadData];
}

@end
