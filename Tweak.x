#import <WebKit/WebKit.h>

%hook WKWebView

- (void)didMoveToWindow {
    %orig;
    NSString *host = self.URL.host;
    if ([host containsString:@"claude.ai"]) {
        NSString *js = @"var s=document.createElement('style');"
                       @"s.textContent='p,div,span,li,h1,h2,h3,h4,textarea,[contenteditable]{direction:rtl!important;text-align:right!important}';"
                       @"document.head.appendChild(s);";
        [self evaluateJavaScript:js completionHandler:nil];
    }
}

%end
