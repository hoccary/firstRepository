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
@interface AddAlarmViewController ()
//views
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIView *repeatView;
@property (weak, nonatomic) IBOutlet UIView *soundView;
@property (weak, nonatomic) IBOutlet UIView *extraView;
//控件
@property (weak, nonatomic) IBOutlet UILabel *noticeLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePicker;
@property (weak, nonatomic) IBOutlet UILabel *repeatSelecter;
@property (weak, nonatomic) IBOutlet UILabel *soundSelecter;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UILabel *isShockBtn;
@property (weak, nonatomic) IBOutlet UILabel *sneapySelecter;
@property (weak, nonatomic) IBOutlet UITextField *commentTextfield;
//按钮
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;
//数据
@property (strong,  nonatomic) AlarmListModel *AlarmModel;

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

- (void)setViewActions{
    [_isShockBtn setViewActionWithBlock:^{
        if(_AlarmModel.isShock == 0){
            _AlarmModel.isShock = 1;
            _isShockBtn.text = @"😱";
        }else{
            _AlarmModel.isShock = 0;
            _isShockBtn.text = @"🙃";
        }
    }];
    
    [_sneapySelecter setViewActionWithBlock:^{
        
    }];
    
    [_soundSelecter setViewActionWithBlock:^{
        
    }];
    
    [_repeatSelecter setViewActionWithBlock:^{
        
    }];
}

//时间选择器时间变化
- (IBAction)timePickerEditingDidEnd:(id)sender {
    _AlarmModel.alartTime = [NSString stringWithFormat:@"%@",_timePicker.date];
}
- (IBAction)timePickerValueChanged:(id)sender {
    _AlarmModel.alartTime = [NSString stringWithFormat:@"%@",_timePicker.date];
}

//音量slider变化
- (IBAction)volumeSliderEditingDidEnd:(id)sender {
    _AlarmModel.volume = (NSInteger)_volumeSlider.value;
}

//textfiled编辑结束
- (IBAction)commentTFEditingDidEnd:(id)sender {
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

@end
