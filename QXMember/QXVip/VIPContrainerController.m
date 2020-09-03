//
//  VIPContrainerController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "VIPContrainerController.h"
#import "VIPMembersController.h"
#import "SVIPMembersController.h"

@interface VIPContrainerController ()

@property (weak, nonatomic) IBOutlet UIStackView *containerStackView;


@end

@implementation VIPContrainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"会员";
    
    [self switchToVip];
    
}

- (void)switchToVip {
    [self addVipControllerRemoveSvip];
}

- (void)switchToSVip {
    [self addSVipControllerRemoveVip];
}

- (void)addVipControllerRemoveSvip {
    if (self.childViewControllers.firstObject) {
        UIViewController * vc = self.childViewControllers.firstObject;
        [self remove:vc with:vc.view];
    }
    
    VIPMembersController *vipMembersController = [[VIPMembersController alloc]
    initWithNibName:@"VIPMembersController"
    bundle:[NSBundle mainBundle]];
    
    [self add:vipMembersController with:vipMembersController.view];
}

- (void)addSVipControllerRemoveVip {
    if (self.childViewControllers.firstObject) {
        UIViewController * vc = self.childViewControllers.firstObject;
        [self remove:vc with:vc.view];
    }
    
    SVIPMembersController *svipMembersController = [[SVIPMembersController alloc]
    initWithNibName:@"SVIPMembersController"
    bundle:[NSBundle mainBundle]];
    
    [self add:svipMembersController with:svipMembersController.view];
}


- (void)addChildController {
    
    //
    VIPMembersController *vipMembersController = [[VIPMembersController alloc]
                                                  initWithNibName:@"VIPMembersController"
                                                  bundle:[NSBundle mainBundle]];
    [self addChildViewController:vipMembersController];
    [self.containerStackView addArrangedSubview:vipMembersController.view];
    [vipMembersController didMoveToParentViewController:self];

    //
    SVIPMembersController *svipMembersController = [[SVIPMembersController alloc]
                                                  initWithNibName:@"SVIPMembersController"
                                                  bundle:[NSBundle mainBundle]];
    [self addChildViewController:svipMembersController];
    [self.containerStackView addArrangedSubview:svipMembersController.view];
    [svipMembersController didMoveToParentViewController:self];
    
}

// MARK: Add Remove
- (void)add:(UIViewController *)controler with:(UIView *)view {
    // Add the view controller to the container.
    [self addChildViewController:controler];
    [self.containerStackView addArrangedSubview:view];
    // Create and activate the constraints for the child’s view.
    
    // Notify the child view controller that the move is complete.
    [controler didMoveToParentViewController:self];
}

- (void)remove:(UIViewController *)controler with:(UIView *)view {
    [controler willMoveToParentViewController:self];
    // remove any constraints for the child’s root view
    
    [view removeFromSuperview];
    [controler removeFromParentViewController];
}

@end
