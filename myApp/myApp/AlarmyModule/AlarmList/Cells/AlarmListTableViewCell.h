//
//  AlarmListTableViewCell.h
//  myApp
//
//  Created by guest on 2018/10/25.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlarmListModel.h"
static const CGFloat CellHeightForAlarmList = 150;

@interface AlarmListTableViewCell : UITableViewCell

//两种cell类型
typedef NS_ENUM(NSUInteger, AlarmyType) {
    AlarmyTypeQuick,
    AlarmyTypeNormal
};
+ (AlarmListTableViewCell*)cellWithType:(AlarmyType)type;

- (void)setupWithModel:(AlarmListModel*)model;
- (void)setAlarmWeekdays:(NSArray*)arr;
- (void)setTime:(NSString*)str;

@end
