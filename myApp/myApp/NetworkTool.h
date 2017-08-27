//
//  NetworkTool.h
//  myApp
//
//  Created by 张东伟 on 17/8/25.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTool : NSObject
+ (instancetype)share;
- (void)downloadFromUrl:(NSString*)serviceURL filePath:(NSString*)filePath;
@end
