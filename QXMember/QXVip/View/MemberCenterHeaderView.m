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
