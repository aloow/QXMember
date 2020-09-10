//
//  BaseXibView.m
//  QXMember
//
//  Created by iMac on 2020/9/10.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "BaseXibView.h"

@implementation BaseXibView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.view = [self loadViewFromNib];
    }
    return self;
}

- (UIView*)loadViewFromNib {
    
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class])
                                bundle:bundle];
    
    UIView *view = [nib instantiateWithOwner:self options:nil][0];
    
    view.frame = self.bounds;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:view];
    
    [self setupView];
    
    return view;
    
}

// @implementation in subview
- (void)setupView {
    NSLog(@"setupView BaseXibView");
}

@end
