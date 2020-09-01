//
//  ViewController.m
//  QXMember
//
//  Created by iMac on 2020/9/1.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "ViewController.h"
#import "QXLoginGetSmsCode.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phone;

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

}

- (IBAction)getUserInfo:(id)sender {


}

@end
