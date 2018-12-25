//
//  CommonFunction.h
//  myApp
//
//  Created by 张东伟 on 17/8/27.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonFunction : NSObject
+ (CGFloat)calHeightForText:(NSString*)text
                   fontSize:(NSInteger)fontSize
                 labelWidth:(CGFloat)labelWidth;
+ (CGFloat)calHeightForText:(NSString*)text;
+ (NSString *)alarmyListFilePath;
+ (NSString*)convertDateToString:(NSDate*)date;
+ (UIView*)addHalfTansparentCover:(UIView*)targetView;
+ (void)removeHalfTranparentCover:(UIView *)targetView;
@end
