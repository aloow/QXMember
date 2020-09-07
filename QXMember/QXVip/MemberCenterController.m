//
//  MemberCenterController.m
//  QXMember
//
//  Created by iMac on 2020/9/4.
//  Copyright © 2020 iMac. All rights reserved.
//  会员中心(已开通会员)

#import "MemberCenterController.h"
#import "MemberCenterCell.h"
#import "MemberCenterHeaderView.h"
#import <Masonry/Masonry.h>

@interface MemberCenterController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation MemberCenterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupTableview];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)setupTableview {
    
    UINib *memberCenterCellNib = [UINib nibWithNibName:@"MemberCenterCell"
                                                bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:memberCenterCellNib
         forCellReuseIdentifier:@"MemberCenterCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    
    MemberCenterHeaderView *headerView = [[MemberCenterHeaderView alloc] init];
    self.tableView.tableHeaderView = headerView;
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 61, 0, 400)
                                                 style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return  _tableView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MemberCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MemberCenterCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}


@end
