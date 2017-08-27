//
//  NetworkTool.m
//  myApp
//
//  Created by 张东伟 on 17/8/25.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "NetworkTool.h"
static NetworkTool *_networkTool = nil;
@implementation NetworkTool
+ (instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _networkTool = [[self alloc] init];
    });
    return _networkTool;
}


- (void)downloadFromUrl:(NSString*)serviceURL filePath:(NSString*)filePath{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:serviceURL];  //下载地址
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request
                                                                     progress:nil
                                                                  destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                                                      NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                                                                                                                            inDomain:NSUserDomainMask
                                                                                                                                   appropriateForURL:nil
                                                                                                                                              create:NO
                                                                                                                                               error:nil
                                                                                                      ];
                                                                      if(filePath){
                                                                          return [documentsDirectoryURL URLByAppendingPathComponent:filePath];
                                                                      }else{
                                                                          return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
                                                                      }
                                                                  }
                                                            completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                                if(error){
                                                                    NSLog(@"Fail to download from: %@", serviceURL);
                                                                }else{
                                                                    NSLog(@"File downloaded to: %@", filePath);
                                                                }
                                                            }];
    [downloadTask resume];
}
@end
