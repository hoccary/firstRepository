//
//  AddAlarmViewModel.m
//  myApp
//
//  Created by guest on 2018/12/19.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import "AddAlarmViewModel.h"

@implementation AddAlarmViewModel
+ (NSString*)translateWeekdayArrToString:(NSArray*)arr{
    int bitset = 0;
    NSString *ordinaryStr = @"周";
    NSArray *weekstr = @[@"日 ",@"一 ",@"二 ",@"三 ",@"四 ",@"五 ",@"六 "];
    for (int i = 0; i!=arr.count; ++i) {
        bitset += [arr[i] integerValue] << i;
        if([arr[i] integerValue]==1)
            ordinaryStr = [ordinaryStr stringByAppendingString:weekstr[i]];
    }
    switch (bitset) {
        case 62://0111110b
            return @"工作日";
            break;
        case 65://1000001b
            return @"周末";
            break;
        case 127://1111111b
            return @"每天";
            break;
        case 0://1111111b
            return @"不重复";
            break;
        default:
            return ordinaryStr;
            break;
    }
    
    return @"";
}

@end
