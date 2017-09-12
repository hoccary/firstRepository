//
//  NetworkTool.h
//  myApp
//
//  Created by 张东伟 on 17/8/25.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkTool : NSObject
PROPERTY_SINGLETON_FOR_CLASS(NetworkTool)
- (void)downloadFromUrl:(NSString*)serviceURL
               filePath:(NSString*)downloadPath
                success:(void(^)(NSString *filePath))successBlock
                   fail:(void(^)(NSError *error))failBlock;

- (void)requestImageFromURL:(NSString*)URLString
                   fileName:(NSString*)filename
                 identifier:(NSString*)identifier
                    success:(void(^)(UIImage *image))successBlock
                       fail:(void(^)(NSError *error))failBlock;

- (void)GetFromUrl:(NSString*)URLString
         URLparams:(NSDictionary*)params
           success:(void(^)(id responseObject))successBlock
              fail:(void(^)(NSError *error))failBlock;
@end
