//
//  AlarmListModel.m
//  myApp
//
//  Created by guest on 2018/11/7.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListModel.h"

@implementation AlarmListModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        _alarmType = [dic[@"alarmType"] integerValue];
        _alartTime = dic[@"alartTime"];
        _alartWeekdays = dic[@"alartWeekdays"];
        _ringTuneName = dic[@"ringTuneName"];
        _volume = [dic[@"alarmType"] integerValue];
        _isShock = [dic[@"isShock"] integerValue];
        _sneapTime = [dic[@"alarmType"] integerValue];
        _isValidate = [dic[@"alarmType"] integerValue];
        _remark = dic[@"alarmType"];
    }
    return self;
}

- (NSDictionary *)covertToDic
{
    return @{
               @"alarmType": [NSNumber numberWithInteger:_alarmType],
               @"alartTime": _alartTime,
               @"alartWeekdays": _alartWeekdays,
               @"ringTuneName": _ringTuneName,
               @"volume": [NSNumber numberWithInteger:_volume],
               @"isShock": [NSNumber numberWithInteger:_isShock],
               @"sneapTime": [NSNumber numberWithInteger:_sneapTime],
               @"isValidate": [NSNumber numberWithInteger:_isValidate],
               @"remark": _remark,
    };
}

@end
