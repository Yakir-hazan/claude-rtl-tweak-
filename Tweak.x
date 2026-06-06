#import <WebKit/WebKit.h>

%hook WKWebView

- (void)loadRequest:(NSURLRequest *)request {
    %orig;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString *js = @"var s=document.createElement('style');"
                       @"s.textContent='p,div,span,li,h1,h2,h3,h4,textarea,[contenteditable]{direction:rtl!important;text-align:right!important}';"
                       @"document.head.appendChild(s);";
        [self evaluateJavaScript:js completionHandler:nil];
    });
}

%end
