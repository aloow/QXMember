//
//  QXLoginGetSmsCode.h
//  QXTestLogin_Example
//
//  Created by iMac on 2020/8/27.
//  Copyright © 2020 aloow. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXLoginGetSmsCode : YTKRequest

- (id)initWithUsername:(NSString *)mobile;

@end

NS_ASSUME_NONNULL_END
