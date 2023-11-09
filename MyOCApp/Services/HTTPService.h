//
//  HTTPService.h
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//callback
typedef void (^onComplete) (NSArray * __nullable dataArray, NSString * __nullable errMessage);
typedef void (^photoDone) (NSData * __nullable photoData, NSString * __nullable errMessage);
@interface HTTPService : NSObject

+ (id)instance; //static func
- (void)getTutorials:(nullable onComplete)completionHandler;
- (void)getphotoWithURL:(NSString*)urlString doneWith:(nullable photoDone)completionHandler;
@end

NS_ASSUME_NONNULL_END
