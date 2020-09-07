//
//  ApiCollector.h
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ApiCollector : NSObject

typedef NS_ENUM(NSInteger, QXApi) {
    LoginGetSms, //
    LoginWithSms
};

@end

NS_ASSUME_NONNULL_END
