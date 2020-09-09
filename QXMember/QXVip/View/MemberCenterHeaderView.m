//
//  MemberCenterHeaderView.m
//  QXMember
//
//  Created by iMac on 2020/9/7.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "MemberCenterHeaderView.h"
#import <YYCategories/YYCategories.h>

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
    view.width = [UIScreen mainScreen].bounds.size.width;
    self.frame = view.bounds;
    [self addSubview:view];
    [self setUserInteractionEnabled:YES];
    
}

// MARK: User Touch
- (IBAction)clickShop:(id)sender {
    
    NSLog(@"clickShop");
    if (self.clickAction != nil) {
        self.clickAction();
    }
    
}
- (IBAction)touch:(id)sender {
    
    NSLog(@"touch");
    
}



@end
