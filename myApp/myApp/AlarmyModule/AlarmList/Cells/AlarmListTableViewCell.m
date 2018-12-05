//
//  AlarmListTableViewCell.m
//  myApp
//
//  Created by guest on 2018/10/25.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListTableViewCell.h"
#import "AlarmListQuickCell.h"
#import "AlarmListNormalCell.h"

@interface AlarmListTableViewCell ()
@property (nonatomic, strong) UIView *contentBackgroundView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UISwitch *switchBtn;
@property (nonatomic, strong) UIImageView *moreBtn;
@property (nonatomic, strong) UIView *bottomBgView;
@property (nonatomic, strong) UIImageView *alarmIcon;
@property (nonatomic, strong) UILabel *weekDaysLabel;
@property (nonatomic, strong) NSArray *weekDaysArray;
@property (nonatomic, strong) NSMutableArray *weekdaysLabelsArray;
@end

@implementation AlarmListTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)init
{
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

+ (AlarmListTableViewCell *)cellWithType:(AlarmyType)type
{
    switch (type) {
        case AlarmyTypeQuick:
            return [AlarmListQuickCell new];
            break;
        case AlarmyTypeNormal:
            return [AlarmListNormalCell new];
            break;
    }
}

- (void)initUI
{
    self.backgroundColor = UIColor.clearColor;
    self.contentView.backgroundColor = UIColor.clearColor;
    self.weekdaysLabelsArray = [NSMutableArray new];
    _weekDaysArray = @[@0, @0, @0, @0, @0, @0, @0];
    [self addSubview:self.contentBackgroundView];
    [self addSubview:self.timeLabel];
    [self addSubview:self.switchBtn];
    [self addSubview:self.moreBtn];
    [self addSubview:self.alarmIcon];
    [self addWeekdaysLabels];
}

- (void)addWeekdaysLabels
{
    NSArray *arr = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    for (int i = 0; i != self.weekDaysArray.count; i++) {
        UILabel *tmpLabel = [UILabel new];
        tmpLabel.frame = CGRectMake(70 + 20 * i, CellHeightForAlarmList - 45, 20, 20);
        tmpLabel.text = arr[i];
        tmpLabel.font = [UIFont systemFontOfSize:15];
        tmpLabel.textColor = [UIColor blackColor];
        [self addSubview:tmpLabel];
        [_weekdaysLabelsArray addObject:tmpLabel];
    }
}

#pragma mark - headMethod
- (void)setupWithModel:(AlarmListModel *)model
{
    [self setAlarmWeekdays:model.alartWeekdays];
    [self setTime:model.alartTime];
    [self setSwitchState:model.isValidate];
}

- (void)setAlarmWeekdays:(NSArray *)arr
{
    [arr enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([obj integerValue] == 1) {
            UILabel *tLabel = _weekdaysLabelsArray[idx];
            tLabel.textColor = UIColor.lightGrayColor;
        }
    }];
}

- (void)setTime:(NSString *)str
{
    self.timeLabel.text = str;
}

- (void)setSwitchState:(NSInteger)isValidate
{
    if (isValidate == 1) {
        [self.switchBtn setOn:YES];
    } else {
        [self.switchBtn setOn:NO];
    }
}

#pragma mark - Lazyload
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.frame = CGRectMake(45, 25, 150, 50);
        _timeLabel.text = @"08:00";
        _timeLabel.font = [UIFont boldSystemFontOfSize:40];
        _timeLabel.textColor = [UIColor blackColor];
        //        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}

- (UIView *)contentBackgroundView
{
    if (!_contentBackgroundView) {
        _contentBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 40, CellHeightForAlarmList - 20)];
        _contentBackgroundView.backgroundColor = UIColor.whiteColor;
        _contentBackgroundView.alpha = 0.3;
        _contentBackgroundView.layer.cornerRadius = 10;
        _contentBackgroundView.layer.masksToBounds = YES;

        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, _contentBackgroundView.frame.size.width, _contentBackgroundView.frame.size.height - 80)];
        bottomView.backgroundColor = UIColor.lightGrayColor;
        [_contentBackgroundView addSubview:bottomView];
    }
    return _contentBackgroundView;
}

- (UISwitch *)switchBtn
{
    if (!_switchBtn) {
        _switchBtn = [[UISwitch alloc] init];
        _switchBtn.center = CGPointMake(kScreenWidth - 110, 50);
    }
    return _switchBtn;
}

- (UIImageView *)moreBtn
{
    if (!_moreBtn) {
        _moreBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moreBtn"]];
        _moreBtn.center = CGPointMake(kScreenWidth - 50, 50);
    }
    return _moreBtn;
}

- (UIImageView *)alarmIcon
{
    if (!_alarmIcon) {
        _alarmIcon = [UIImageView new];
        _alarmIcon.frame = CGRectMake(45, CellHeightForAlarmList - 45, 20, 20);
        _alarmIcon.image = [UIImage imageNamed:@"alarmIcon"];
    }
    return _alarmIcon;
}

//
//- (UILabel *)weekDaysLabel{
//    if(!_weekDaysLabel){
//        _weekDaysLabel = [UILabel new];
//        _weekDaysLabel.frame = CGRectMake(70, CellHeightForAlarmList - 45, 200, 20);
//        _weekDaysLabel.text = @"日 一 二 三 四 五 六";
//        _weekDaysLabel.font = [UIFont systemFontOfSize:15];
//        _weekDaysLabel.textColor = [UIColor blackColor];
//    }
//    return _weekDaysLabel;
//}
@end
