//
//  UIView+Action.h
//  myApp
//
//  Created by guest on 2018/12/19.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Action)
- (void)setViewActionWithBlock:(void (^)(void))block ;
@end