//
//  AlarmListModel.m
//  myApp
//
//  Created by guest on 2018/11/7.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListModel.h"

@implementation AlarmListModel
- (instancetype)initWithDic:(NSDictionary*)dic{
    if(self = [super init]){
        _alartTime = dic[@"alartTime"];
        _alartWeekdays = dic[@"alartWeekdays"];
        _isValidate = [dic[@"isValidate"] integerValue];
    }
    return self;
}
@end
