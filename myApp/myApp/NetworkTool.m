//
//  NetworkTool.m
//  myApp
//
//  Created by 张东伟 on 17/8/25.
//  Copyright © 2017年 张东伟. All rights reserved.
//

#import "NetworkTool.h"


@implementation NetworkTool

//单例化
SYNTHESIZE_SINGLETON_FOR_CLASS(NetworkTool)

- (void)GetFromUrl:(NSString*)URLString
         URLparams:(NSDictionary*)params
           success:(void(^)(id responseObject))successBlock
              fail:(void(^)(NSError *error))failBlock{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:URLString parameters:params error:nil];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            failBlock(error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            successBlock(responseObject);
        }
    }];
    
    [dataTask resume];
}


- (void)downloadFromUrl:(NSString*)serviceURL
               filePath:(NSString*)downloadedPath
                success:(void(^)(NSString *downloadedPath))successBlock
                   fail:(void(^)(NSError *error))failBlock{
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
                                                                      if(downloadedPath){
                                                                          return [NSURL URLWithString:downloadedPath];
                                                                      }else{
                                                                          return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
                                                                      }
                                                                  }
                                                            completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                                                if(error){
                                                                    NSLog(@"Fail to download from: %@", serviceURL);
                                                                    failBlock(error);
                                                                }else{
                                                                    NSLog(@"File downloaded to: %@", filePath);
                                                                    successBlock(downloadedPath);
                                                                }
                                                            }];
    [downloadTask resume];
}
@end
