//
//  QXBaseRequest.m
//  QXProject
//
//  Created by monda on 2019/12/18.
//  Copyright © 2019 monda. All rights reserved.
//

#import "QXBaseRequest.h"
#import "QXRespone.h"
#import <MJExtension/MJExtension.h>

@interface QXBaseRequest()

@end

@implementation QXBaseRequest

- (Class)modelClass {
    return _cls;
}

- (NSString *)requestUrl {
    return _urlString;
}

- (id)requestArgument {
    return _paramters;
}

- (YTKRequestMethod)requestMethod{
    if (_method != YTKRequestMethodGET) {
        return _method;
    }
    return YTKRequestMethodGET;
}

- (NSTimeInterval)requestTimeoutInterval{
    return 15;
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

- (YTKResponseSerializerType)responseSerializerType {
    return YTKResponseSerializerTypeJSON;
}

- (void)requestCompletePreprocessor{
    [super requestCompletePreprocessor];
    [self JSONConvertModel:self];
    NSLog(@"%@\n%@", self.description, self.responseJSONObject);
}

- (void)requestFailedPreprocessor {
    [super requestFailedPreprocessor];
    NSLog(@"%@\n%@", self.description, self.error);
    
    _responeMessage = @"网络不给力";
}

///json转model的具体方法
- (void)JSONConvertModel:(QXBaseRequest*)request {
    
    Class modelClass = [request.modelClass class];
    
    NSError * error = nil;
    if ([request.responseJSONObject isKindOfClass:[NSDictionary class]]) {
        
        QXRespone *respone = [QXRespone mj_objectWithKeyValues:request.responseJSONObject];
        _responeMessage = respone.msg;
        _success = (respone.retCode == 1);
        _retCode = respone.retCode;
        _extra = respone.extra;
        
        NSString* requestName = NSStringFromClass(self.class);
        //        if([requestName isEqualToString:@"QXOrderRequest"] || [requestName isEqualToString:@"QXAfterSalesRequest"]  || [requestName isEqualToString:@"QXUserServiceRequest"] || [requestName isEqualToString:@"ShopCarRequest"])
        if(![requestName isEqualToString:@"GoodsRequest"] && ![request.urlString isEqualToString:@"/nk/member/address/list"])
        {
            if(_retCode == 401 /*|| _retCode == 100*/)
                [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationDidUserLoginTimeOut" object:nil];
        }
        
        if (modelClass) {
            
            //如果返回的result是个数组
            if ([respone.result isKindOfClass:[NSArray class]]) {
                request.responseJSONModel = [[modelClass mj_objectArrayWithKeyValuesArray:respone.result] mutableCopy];
                
                return ;
            }
            
            request.responseJSONModel = [modelClass mj_objectWithKeyValues:respone.result] ;
            
            return;
        }
        else
            request.responseJSONModel = request.responseJSONObject;
        
    } else if ([request.responseJSONObject isKindOfClass:[NSArray class]]){
        
        if (modelClass) {
            request.responseJSONModel = [modelClass mj_objectArrayWithKeyValuesArray:request.responseJSONObject];
        }
        else
            request.responseJSONModel = request.responseJSONObject;
    }else {
        request.responseJSONModel = request.responseJSONObject;
    }
}

- (BOOL)statusCodeValidator {
    return YES;
    //return [super statusCodeValidator];
}


@end
