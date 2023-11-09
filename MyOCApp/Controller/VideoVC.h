//
//  VideoVC.h
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/26.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@class Video;
NS_ASSUME_NONNULL_BEGIN

@interface VideoVC : UIViewController<WKNavigationDelegate>
@property (nonatomic, strong) Video *video;
@end

NS_ASSUME_NONNULL_END
