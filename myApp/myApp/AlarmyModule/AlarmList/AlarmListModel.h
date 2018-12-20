//
//  AlarmListModel.h
//  myApp
//
//  Created by guest on 2018/11/7.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 * 闹钟类型
    时间
    重复日
    声音
    音量
    是否震动
    小睡
    是否开启
    标签备注
 */
@interface AlarmListModel : NSObject
@property (nonatomic, assign) NSInteger alarmType; //0|1
@property (nonatomic, copy) NSString *alartTime;
/*
 重复日,eg: @"alartWeekdays": @[@0, @1, @0, @0, @0, @0, @0],
 */
@property (nonatomic, strong) NSArray *alartWeekdays;
@property (nonatomic, copy) NSString *ringTuneName;
@property (nonatomic, assign) NSInteger volume;
@property (nonatomic, assign) NSInteger isShock;
@property (nonatomic, assign) NSInteger sneapTime;
@property (nonatomic, assign) NSInteger isValidate;
@property (nonatomic, copy) NSString *remark;

- (instancetype)initWithDic:(NSDictionary*)dic;
- (NSDictionary*)covertToDic;
@end
