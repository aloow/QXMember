//
//  MembershipInterestsAlterView.m
//  QXMember
//
//  Created by iMac on 2020/9/3.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MembershipInterestsAlterView.h"
#import <LEEAlert.h>

@interface MembershipInterestsAlterView()

//@property (weak, nonatomic) IBOutlet UILabel *scribingView;

@end


@implementation MembershipInterestsAlterView


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
    
    UIView *view = [[NSBundle mainBundle] loadNibNamed:@"MembershipInterestsAlterView"
                                                 owner:self options:nil].firstObject;
    self.frame = view.bounds;
    [self addSubview:view];
    
}

+ (instancetype)instance {
    return [[[NSBundle mainBundle] loadNibNamed:@"MembershipInterestsAlterView"
                                          owner:nil options:nil]lastObject];
}

- (IBAction)closeTap:(id)sender {
    
    [LEEAlert closeWithCompletionBlock:^{
        // 如果在关闭后需要做一些其他操作 建议在该Block中进行
    }];
    
}


@end

/*
 
 
 
 */
