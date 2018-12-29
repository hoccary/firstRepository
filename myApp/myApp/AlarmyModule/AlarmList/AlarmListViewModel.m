//
//  AlarmListViewModel.m
//  myApp
//
//  Created by guest on 2018/11/7.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AlarmListViewModel.h"

@implementation AlarmListViewModel

//计算下一个响铃时间是多少
- (NSString*)cimputeLatestRemainTimeByTime:(NSString*)time weekdaysArray:(NSArray*)weekdaysArr{
    if([weekdaysArr containsObject:@1]){
        //不重复
        return @"1";
    }else{
        NSInteger todayWeekday = [CommonFunction getTheWeekday];
        NSString *nowTime = @"1108";
        if([weekdaysArr[todayWeekday] integerValue] == 1){
            //当天重复
            return @"time - nowtime";
        }else{
            //非当天重复
            for(NSInteger i = todayWeekday + 1;i!=todayWeekday+6;i++){
                if([weekdaysArr[i % 7] integerValue] == 1){
                    return @"today + i - nowtime";
                }
            }
        }
    }
    return @"";
}



@end
