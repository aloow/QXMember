//
//  VIPMembersController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "VIPMembersController.h"
#import "VIPContrainerController.h"
#import <JXBWebViewController.h>
#import "MembershipInterestsAlterView.h"
#import <LEEAlert.h>
#import "IncomeDetailController.h"

@interface VIPMembersController ()

@end

@implementation VIPMembersController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)swichToSvip:(id)sender {

    VIPContrainerController *vipContrainer = self.parentViewController;
    [vipContrainer switchToSVip];
    
}

- (IBAction)midTap:(UITapGestureRecognizer *)sender {
    
    NSString *urlString = @"https://mall-nk.liux.co/pagesHelp/member/memberNews?indexNum=";
    [urlString stringByAppendingFormat:@"%ld",(long)sender.view.tag];
    JXBWebViewController *webView = [[JXBWebViewController alloc] initWithURLString:urlString];
    [self.parentViewController.navigationController pushViewController:webView animated:true];
    
}

const CGFloat QMUIViewSelfSizingHeight = INFINITY;

- (IBAction)InviteTap:(id)sender {
    
    // 弹窗
//    MembershipInterestsAlterView *view = [[MembershipInterestsAlterView alloc] init];
//
//    [LEEAlert actionsheet].config
//    .LeeCustomView(view)
//    .LeeHeaderInsets(UIEdgeInsetsMake(0, 0, 0, 0))
//    .LeeActionSheetBackgroundColor([UIColor whiteColor])
//    .LeeCornerRadius(10.0f)
//    .LeeActionSheetHeaderCornerRadii(CornerRadiiMake(0, 0, 0, 0))
//    .LeeMaxWidth([UIScreen mainScreen].bounds.size.width)
//    .LeeShow();
    
    // 收入明细
    IncomeDetailController *incomeDetailController = [[IncomeDetailController alloc] init];
    [self.navigationController pushViewController:incomeDetailController animated:YES];
    
}


@end
