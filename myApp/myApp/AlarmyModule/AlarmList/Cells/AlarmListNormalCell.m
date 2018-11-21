//
//  AlarmListNormalCell.m
//  myApp
//
//  Created by guest on 2018/11/6.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListNormalCell.h"

@interface AlarmListNormalCell()
//@property (nonatomic, strong) UIView *contentBackgroundView;
//@property (nonatomic, strong) UILabel *timeLabel;
//@property (nonatomic, strong) UISwitch *switchBtn;
//@property (nonatomic, strong) UIImageView *moreBtn;
//@property (nonatomic, strong) UIView *bottomBgView;
//@property (nonatomic, strong) UIImageView *alarmIcon;
//@property (nonatomic, strong) UILabel *weekDaysLabel;
//@property (nonatomic, strong) UILabel *weekDaysArray;
@end

@implementation AlarmListNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (instancetype)init{
//    if(self = [super init]){
//        [self initUI];
//    }
//    return self;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//
//- (void)initUI{
//    self.backgroundColor = UIColor.clearColor;
//    self.contentView.backgroundColor = UIColor.clearColor;
//    [self addSubview:self.contentBackgroundView];
//    [self addSubview:self.timeLabel];
//    [self addSubview:self.switchBtn];
//    [self addSubview:self.moreBtn];
//    [self addSubview:self.alarmIcon];
//    [self addSubview:self.weekDaysLabel];
//}
//
//
//
//#pragma mark - Lazyload
//-(UILabel *)timeLabel{
//    if(!_timeLabel){
//        _timeLabel = [UILabel new];
//        _timeLabel.frame = CGRectMake(45, 25, 150, 50);
//        _timeLabel.text = @"08:00";
//        _timeLabel.font = [UIFont boldSystemFontOfSize:40];
//        _timeLabel.textColor = [UIColor blackColor];
////        _timeLabel.textAlignment = NSTextAlignmentCenter;
//    }
//    return _timeLabel;
//}
//
//- (UIView *)contentBackgroundView{
//    if(!_contentBackgroundView){
//        _contentBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 40, CellHeightForAlarmList - 20)];
//        _contentBackgroundView.backgroundColor = UIColor.whiteColor;
//        _contentBackgroundView.alpha = 0.3;
//        _contentBackgroundView.layer.cornerRadius = 10;
//        _contentBackgroundView.layer.masksToBounds = YES;
//
//        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, _contentBackgroundView.frame.size.width, _contentBackgroundView.frame.size.height - 80)];
//        bottomView.backgroundColor = UIColor.lightGrayColor;
//        [_contentBackgroundView addSubview:bottomView];
//    }
//    return _contentBackgroundView;
//}
//
//- (UISwitch *)switchBtn{
//    if(!_switchBtn){
//        _switchBtn = [[UISwitch alloc] init];
//        _switchBtn.center = CGPointMake(kScreenWidth-110, 50);
//    }
//    return _switchBtn;
//}
//
//- (UIImageView *)moreBtn{
//    if(!_moreBtn){
//        _moreBtn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moreBtn"]];
//        _moreBtn.center = CGPointMake(kScreenWidth-50, 50);
//    }
//    return _moreBtn;
//}
//
//- (UIImageView *)alarmIcon{
//    if(!_alarmIcon){
//        _alarmIcon = [UIImageView new];
//        _alarmIcon.frame = CGRectMake(45, CellHeightForAlarmList - 45, 20, 20);
//        _alarmIcon.image = [UIImage imageNamed:@"alarmIcon"];
//    }
//    return _alarmIcon;
//}
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
