#import <WebKit/WebKit.h>

%hook WKWebView

- (void)didMoveToWindow {
    %orig;
    
    NSString *urlString = self.URL.absoluteString;
    if (urlString && [urlString containsString:@"claude.ai"]) {
        NSString *js = @"document.documentElement.style.direction='rtl';"
                       @"var s=document.createElement('style');"
                       @"s.textContent='p,div,span,li,h1,h2,h3,h4,textarea,[contenteditable]{direction:rtl!important;text-align:right!important}';"
                       @"document.head.appendChild(s);";
        [self evaluateJavaScript:js completionHandler:nil];
    }
}

%end
