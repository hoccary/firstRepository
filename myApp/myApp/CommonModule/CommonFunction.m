//
//  CommonFunction.m
//  myApp
//
//  Created by 张东伟 on 17/8/27.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "CommonFunction.h"

@implementation CommonFunction

//根据文字计算cell高度
+ (CGFloat)calHeightForText:(NSString *)text
{
    return [CommonFunction calHeightForText:text fontSize:14 labelWidth:kScreenWidth - 20];
}

+ (CGFloat)calHeightForText:(NSString *)text
                   fontSize:(NSInteger)fontSize
                 labelWidth:(CGFloat)labelWidth
{
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(labelWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:fontSize] } context:nil];
    return rect.size.height + 20;
}

+ (NSString *)alarmyListFilePath
{
    //查找Document目录并在其后附加数据文件的文件名，这样就得到了数据文件的完整的路径

//    NSArray *paths = NSSearchPathForDirectoriesInDomains(
//                                                         NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentDirectory = [paths objectAtIndex:0];

    return [kPathDocument stringByAppendingPathComponent:@"alarmyList.plist"];
}

//从nsdate转换到string
+ (NSString *)convertDateToString:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
}

+ (NSInteger)getTheWeekday
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    now = [NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return [comps weekday] - 1;
}

+ (UIView *)addHalfTansparentCover:(UIView *)targetView
{
    UIView *coverview = [[UIView alloc] initWithFrame:targetView.frame];
    coverview.tag = 930117;
    coverview.backgroundColor = UIColor.blackColor;
    coverview.alpha = 0.7;
    [targetView addSubview:coverview];
    return coverview;
}

+ (void)removeHalfTranparentCover:(UIView *)targetView
{
    [targetView viewWithTag:930117] ? [[targetView viewWithTag:930117] dw_shadeOff] : nil;
}

@end
