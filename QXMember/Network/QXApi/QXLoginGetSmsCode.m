//
//  QXLoginGetSmsCode.m
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/27.
//  Copyright © 2020 aloow. All rights reserved.
//  发送短信验证码

#import "QXLoginGetSmsCode.h"
#import "QXHostNameManager.h"

@implementation QXLoginGetSmsCode{
    NSString *_mobile;
}

- (id)initWithUsername:(NSString *)mobile {
    self = [super init];
    if (self) {
        _mobile = mobile;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/newUserCenter/smsCaptcha";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{
        @"service": @"nk",
        @"type": @"login",
        @"mobile": _mobile
    };
}

- (NSString *)baseUrl {
    return [QXHostNameManager share].currentHost.userHost;
}


@end
