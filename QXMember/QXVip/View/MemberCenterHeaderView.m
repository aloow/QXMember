//
//  MemberCenterHeaderView.m
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MemberCenterHeaderView.h"

@implementation MemberCenterHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"MemberCenterHeaderView"
                                                 owner:self options:nil].firstObject;
    self.frame = view.bounds;
    [self addSubview:view];
    
}

@end
