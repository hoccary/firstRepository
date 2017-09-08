//
//  OnPlayModel.m
//  myApp
//
//  Created by 张东伟 on 17/9/2.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "OnPlayModel.h"

@implementation OnPlayModel
- (instancetype)initWithDic:(NSDictionary*)dic{
    self = [super init];
    if(self){
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
