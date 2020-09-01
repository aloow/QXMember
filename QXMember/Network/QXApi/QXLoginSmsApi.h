//
//  QXLoginSmsApi.h
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/26.
//  Copyright © 2020 aloow. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXLoginSmsApi : YTKRequest

- (id)initWithUsername:(NSString *)mobile smsCaptcha:(NSString *)smsCaptcha;

@end

NS_ASSUME_NONNULL_END
