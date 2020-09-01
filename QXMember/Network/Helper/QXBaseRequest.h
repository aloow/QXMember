//
//  QXBaseRequest.h
//  QXProject
//
//  Created by monda on 2019/12/18.
//  Copyright © 2019 monda. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^QXCompeletCallback)(__nullable id obj, NSString *mssage, BOOL suuccess);


@interface QXBaseRequest : YTKRequest

@property (nonatomic, strong) Class cls;

@property (nonatomic, strong) NSDictionary *paramters;

@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, assign) YTKRequestMethod method;

@property (nonatomic, assign) BOOL success;
@property (nonatomic, assign) NSInteger retCode;
@property (nonatomic, copy) NSString *responeMessage;
@property (nonatomic, copy) NSString *extra;

///模型数据(有可能是数组)
@property (nonatomic, strong, nullable) id responseJSONModel;


- (Class)modelClass;

@end

NS_ASSUME_NONNULL_END
