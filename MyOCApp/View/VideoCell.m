//
//  VideoCell.m
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/26.
//

#import "VideoCell.h"
#import "Video.h"
#import "HTTPService.h"

@interface VideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;
@property (weak, nonatomic) IBOutlet UIView *cellView;


@end
@implementation VideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0 / 255.0 green:157.0 / 255.0 blue:157.0 / 255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateUI:(nonnull Video*)video {
    self.titleLabel.text = video.videoTitle;
    self.descLabel.text = video.videoDescription;
    
//   UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailUrl]]];
//    self.thumbImg.image = image;
    [[HTTPService instance] getphotoWithURL:video.thumbnailUrl doneWith:^(NSData * _Nullable photoData, NSString * _Nullable errMessage) {
        if (photoData) {
            dispatch_async(dispatch_get_main_queue(), ^{

                self.thumbImg.image = [UIImage imageWithData:photoData];
                
            });
        }
        
    }];
}

@end
