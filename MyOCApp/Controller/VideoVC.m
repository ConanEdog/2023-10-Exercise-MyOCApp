//
//  VideoVC.m
//  MyOCApp
//
//  Created by 方奎元 on 2023/10/26.
//

#import "VideoVC.h"
#import "Video.h"
#import <WebKit/WebKit.h>

@interface VideoVC ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightOfWebView;

@end

@implementation VideoVC

- (IBAction)donePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webView.navigationDelegate = self;
    
    self.titleLabel.text = self.video.videoTitle;
    self.descLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
    
    NSString *css = @".container { position: relative; width: 100%; height: 0; padding-bottom: 56.25%; } .video { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                     "styleNode.type = \"text/css\";\n"
                     "var styleText = document.createTextNode('%@');\n"
                     "styleNode.appendChild(styleText);\n"
                     "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    NSLog(@"js:\n%@",js);
    [self.webView evaluateJavaScript:js completionHandler:nil];
    
    
    [self setWebViewHeight];
}

- (void) setWebViewHeight{
    
    [self.webView evaluateJavaScript:@"document.body.scrollHeight;" completionHandler:^(NSObject * _Nullable result, NSError * _Nullable error) {
        NSString *str = (NSString*)result;
        self.heightOfWebView.constant = str.floatValue;
        
        NSLog(@"height: %f", str.floatValue);
    }];
    
}

@end
