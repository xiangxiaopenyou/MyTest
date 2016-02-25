//
//  DownloadVideo.m
//  test
//
//  Created by xlp on 15/11/3.
//  Copyright © 2015年 realtech. All rights reserved.
//

#import "DownloadVideo.h"
#import <AFNetworking.h>

@implementation DownloadVideo
- (void)downloadFileURL:(NSString *)urlString fileName:(NSString *)fileName tag:(NSInteger)tag {
    NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Private/Documents/Cache"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:cachePath]) {
        [fileManager createDirectoryAtPath:cachePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    if (![fileManager fileExistsAtPath:[cachePath stringByAppendingPathComponent:fileName]]) {
        //下载文件
        NSURL *url = [[NSURL alloc] initWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request addValue:@"video/mp4" forHTTPHeaderField:@"Content_Type"];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.inputStream = [NSInputStream inputStreamWithURL:url];
        operation.outputStream = [NSOutputStream outputStreamToFileAtPath:[cachePath stringByAppendingPathComponent:fileName] append:NO];
        [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        }];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
        [operation start];
        
    } else {
        
    }
}

@end
