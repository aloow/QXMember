//
//  QXLoginSmsApi.m
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/26.
//  Copyright © 2020 aloow. All rights reserved.
//  用短信验证码登录

#import "QXLoginSmsApi.h"
#import "QXHostNameManager.h"

@implementation QXLoginSmsApi {
    NSString *_smsCaptcha;
    NSString *_mobile;
}

- (id)initWithUsername:(NSString *)mobile smsCaptcha:(NSString *)smsCaptcha {
    self = [super init];
    if (self) {
        _smsCaptcha = smsCaptcha;
        _mobile = mobile;
    }
    return self;
}

- (NSString *)requestUrl {
    return @"/newUserCenter/doLoginApp";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (id)requestArgument {
    return @{
        @"smsCaptcha":_smsCaptcha,
        @"mobile":_mobile,
        @"clientType": @"ios"
    };
}

- (NSString *)baseUrl {
    return [QXHostNameManager share].currentHost.userHost;
}

@end
