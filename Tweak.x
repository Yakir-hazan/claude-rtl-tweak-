#import <WebKit/WebKit.h>

%hook WKWebViewConfiguration

- (instancetype)init {
    id orig = %orig;
    
    NSString *css = @"p,div,span,li,h1,h2,h3,h4,textarea,[contenteditable]{"
                    @"direction:rtl!important;text-align:right!important}";
    NSString *js = [NSString stringWithFormat:
                    @"var s=document.createElement('style');"
                    @"s.textContent='%@';"
                    @"document.documentElement.appendChild(s);", css];
    
    WKUserScript *script = [[WKUserScript alloc]
        initWithSource:js
        injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
        forMainFrameOnly:NO];
    
    [orig.userContentController addUserScript:script];
    return orig;
}

%end
