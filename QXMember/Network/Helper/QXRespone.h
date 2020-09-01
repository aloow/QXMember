//
//  QXRespone.h
//  QXProject
//
//  Created by monda on 2019/12/20.
//  Copyright © 2019 monda. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QXRespone : NSObject
@property (nonatomic, strong) id result;
@property (nonatomic, copy)   NSString *msg;
@property (nonatomic, assign) BOOL succ;
@property (nonatomic, assign) NSInteger retCode;
@property (nonatomic, copy) NSString *extra;
@end


NS_ASSUME_NONNULL_END
