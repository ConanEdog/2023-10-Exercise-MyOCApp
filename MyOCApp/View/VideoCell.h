//
//  VideoCell.h
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/26.
//

#import <UIKit/UIKit.h>
@class Video; //use other class, brings less than the import
NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : UITableViewCell
- (void)updateUI:(nonnull Video*)video;
@end

NS_ASSUME_NONNULL_END
