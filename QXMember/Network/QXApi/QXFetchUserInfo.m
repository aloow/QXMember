//
//  QXFetchUserInfo.m
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/27.
//  Copyright © 2020 aloow. All rights reserved.
//  用cookie登录

#import "QXFetchUserInfo.h"
#import "QXHostNameManager.h"

@implementation QXFetchUserInfo

- (NSString *)requestUrl {
    return @"/nk/member/uc/info";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSString *)baseUrl {
    return [QXHostNameManager share].currentHost.mallHost;
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary {
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    NSDictionary *Request = [NSHTTPCookie requestHeaderFieldsWithCookies:cookies];
    NSString *cookie = [Request objectForKey:@"Cookie"];
    if (cookie) {
        return @{@"Cookie": cookie};
    } else {
        return nil;
    }
}

@end
