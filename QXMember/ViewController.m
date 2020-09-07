//
//  ViewController.m
//  QXMember
//
//  Created by iMac on 2020/9/1.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "ViewController.h"
#import "QXLoginGetSmsCode.h"
#import "QXLoginSmsApi.h"
#import "QXFetchUserInfo.h"
#import "VIPContrainerController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *code;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// MARK: UserTouch
- (IBAction)sendsMsTap:(id)sender {

    NSString *username = self.phone.text;
    if (username.length > 0) {
        
        QXLoginGetSmsCode *api = [[QXLoginGetSmsCode alloc] initWithUsername:username];
        
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            // NSLog(@"succeed");
            NSLog(@"succeed");
        } failure:^(YTKBaseRequest *request) {
            // NSLog(@"failed");
            NSLog(@"failed");
        }];
    }
    
}

- (IBAction)loginTap:(id)sender {

    NSString *code = self.code.text;
    if (code.length > 0) {
        
        QXLoginSmsApi *api = [[QXLoginSmsApi alloc] initWithUsername:code smsCaptcha:code];
        
        [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
            // NSLog(@"succeed");
            NSLog(@"succeed");
        } failure:^(YTKBaseRequest *request) {
            // NSLog(@"failed");
            NSLog(@"failed");
        }];
    }
    
}
/*

 */
- (IBAction)getUserInfo:(id)sender {

    QXFetchUserInfo *api = [[QXFetchUserInfo alloc] init];
    
    [api startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        // NSLog(@"succeed");
        NSLog(@"succeed");
    } failure:^(YTKBaseRequest *request) {
        // NSLog(@"failed");
        NSLog(@"failed");
    }];

}

- (IBAction)toVIPViewcontroller:(id)sender {

    VIPContrainerController *vipContrainerController = [[VIPContrainerController alloc]
                                                        initWithNibName:@"VIPContrainerController"
                                                        bundle:[NSBundle mainBundle]];
    [self.navigationController pushViewController:vipContrainerController animated:true];

}


@end
