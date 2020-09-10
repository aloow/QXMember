//
//  MemberCenterHeaderView.h
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "BaseXibView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickAction)(void);

@interface MemberCenterHeaderView : BaseXibView

@property (nonatomic, copy) void(^clickAction)(void);

@end

NS_ASSUME_NONNULL_END
