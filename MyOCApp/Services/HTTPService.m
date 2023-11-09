//
//  HTTPService.m
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/25.
//

#import "HTTPService.h"

#define URL_BASE "http:/localhost:8888"
#define URL_TUTORIALS "/test/Objc.php"

@implementation HTTPService

+ (id)instance {
    static HTTPService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc]init];
    }
    
    return sharedInstance;
}

- (void)getTutorials:(nullable onComplete)completionHandler {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_TUTORIALS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                completionHandler(json, nil);
            } else {
                completionHandler(nil, @"Data is corrupt.");
            }
            
        } else {
            NSLog(@"Network Err: %@", error.debugDescription);
            completionHandler(nil, @"Problem connecting to the server.");
        }
    }] resume];
}


- (void)getphotoWithURL:(NSString*)urlString doneWith:(nullable photoDone)completionHandler; {
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            completionHandler(data, nil);
        } else {
            completionHandler(nil, @"error");
        }
        
    }] resume];
}
@end
