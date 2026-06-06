#import <WebKit/WebKit.h>

__attribute__((constructor)) static void init() {}

%hook WKWebViewConfiguration

- (instancetype)init {
    WKWebViewConfiguration *orig = %orig;
    
    NSString *js = @"var s=document.createElement('style');"
                   @"s.textContent='p,div,span,li,h1,h2,h3,h4,textarea,[contenteditable]{direction:rtl!important;text-align:right!important}';"
                   @"document.documentElement.appendChild(s);";
    
    WKUserScript *script = [[WKUserScript alloc]
        initWithSource:js
        injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
        forMainFrameOnly:NO];
    
    [orig.userContentController addUserScript:script];
    return orig;
}

%end
