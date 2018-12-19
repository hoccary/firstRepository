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

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *completeBtn;

@end

@implementation AddAlarmViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//时间选择器时间变化
- (IBAction)timePickerEditingDidEnd:(id)sender {
    
}

//音量slider变化
- (IBAction)volumeSliderEditingDidEnd:(id)sender {
    
}

//textfiled编辑结束
- (IBAction)commentTFEditingDidEnd:(id)sender {
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
