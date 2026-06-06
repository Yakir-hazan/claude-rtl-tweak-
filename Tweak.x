#import <WebKit/WebKit.h>

%hook WKWebView

- (instancetype)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration {
    NSString *rtlScript = @"var style = document.createElement('style');"
                          @"style.innerHTML = 'body,div,p,span,input,textarea{"
                          @"direction:rtl!important;text-align:right!important}';"
                          @"document.head.appendChild(style);";
    
    WKUserScript *script = [[WKUserScript alloc]
        initWithSource:rtlScript
        injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
        forMainFrameOnly:NO];
    
    [configuration.userContentController addUserScript:script];
    return %orig(frame, configuration);
}

%end
