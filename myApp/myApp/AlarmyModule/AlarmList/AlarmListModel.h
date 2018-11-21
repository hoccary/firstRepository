//
//  AlarmListModel.h
//  myApp
//
//  Created by guest on 2018/11/7.
//  Copyright © 2018年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlarmListModel : NSObject
@property (nonatomic, copy) NSString *alartTime;
@property (nonatomic, strong) NSArray *alartWeekdays;
@property (nonatomic, assign) NSInteger isValidate;
- (instancetype)initWithDic:(NSDictionary*)dic;
@end
