//
//  SVIPMembersController.m
//  QXMember
//
//  Created by iMac on 2020/9/2.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "SVIPMembersController.h"
#import "VIPContrainerController.h"
#import <JXBWebViewController.h>
#import "MemberCenterController.h"

@interface SVIPMembersController ()

@end

@implementation SVIPMembersController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)swichToVip:(id)sender {

    VIPContrainerController *vipContrainer = self.parentViewController;
    [vipContrainer switchToVip];
    
}

- (IBAction)midTap:(UITapGestureRecognizer *)sender {
    // 0开始
    NSString *urlString = @"https://mall-nk.liux.co/pagesHelp/member/memberNews?indexNum=";
    [urlString stringByAppendingFormat:@"%ld",(long)sender.view.tag];
    JXBWebViewController *webView = [[JXBWebViewController alloc] initWithURLString:urlString];
    [self.parentViewController.navigationController pushViewController:webView animated:true];
    
}

- (IBAction)upgradeTap:(id)sender {
    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    MemberCenterController * vc = [sb instantiateViewControllerWithIdentifier:@"MemberCenterController"];
    
    MemberCenterController * vc = [[MemberCenterController alloc] init];
    
    [self.navigationController pushViewController:vc animated:true];
    
}


@end
