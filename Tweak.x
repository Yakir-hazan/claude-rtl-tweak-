// ClaudeRTL - Injects RTL CSS into Claude.ai PWA WebView
#import <WebKit/WebKit.h>

%hook WKUserContentController

- (void)addUserScript:(WKUserScript *)userScript {
    NSString *rtlCSS = @"var s=document.getElementById('claude-rtl');"
        "if(!s){"
        "s=document.createElement('style');"
        "s.id='claude-rtl';"
        "s.textContent='"
        "p,li,h1,h2,h3,h4,h5,h6,"
        ".whitespace-pre-wrap,"
        "[class*=prose],"
        "[class*=font-claude]"
        "{direction:rtl!important;text-align:right!important;}"
        "[contenteditable]"
        "{direction:rtl!important;text-align:right!important;}"
        "';"
        "document.head.appendChild(s);"
        "new MutationObserver(function(){"
        "if(!document.getElementById('claude-rtl'))document.head.appendChild(s);"
        "}).observe(document.body,{childList:true,subtree:true});"
        "}";
    
    WKUserScript *rtl = [[WKUserScript alloc]
        initWithSource:rtlCSS
        injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
        forMainFrameOnly:NO];
    %orig(rtl);
    %orig;
}

%end
