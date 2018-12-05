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
+ (CGFloat)calHeightForText:(NSString*)text{
    return [CommonFunction calHeightForText:text fontSize:14 labelWidth:kScreenWidth - 20];
}

+ (CGFloat)calHeightForText:(NSString*)text
                   fontSize:(NSInteger)fontSize
                 labelWidth:(CGFloat)labelWidth{
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(labelWidth, MAXFLOAT) lineBreakMode:NSLineBreakByCharWrapping];
    CGRect rect = [text boundingRectWithSize:CGSizeMake(labelWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size.height+20;
}
@end
