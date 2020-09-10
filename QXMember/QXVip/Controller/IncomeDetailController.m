//
//  IncomeDetailController.m
//  QXMember
//
//  Created by iMac on 2020/9/8.
//  Copyright © 2020 iMac. All rights reserved.
//  收入明细

#import "IncomeDetailController.h"
#import "IncomeDetailListController.h"
#import <YYCategories/YYCategories.h>
#import "TypeSelectView.h"
#import <Masonry/Masonry.h>
#import "TestMyView.h"


@interface IncomeDetailController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) JXCategoryTitleView *categoryView;

@property (nonatomic, strong) TypeSelectView *tsView;

@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@property (nonatomic, strong) TestMyView *tview;

@end

@implementation IncomeDetailController

// MARK: life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupCategory];
    [self setupSelectView];
//    [self setupCategoryListContainerView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //处于第一个item的时候，才允许屏幕边缘手势返回
    self.navigationController.interactivePopGestureRecognizer.enabled = (self.categoryView.selectedIndex == 0);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    //离开页面的时候，需要恢复屏幕边缘手势，不能影响其他页面
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

// MARK:Set up view
- (void)setupCategory {
    //
    self.titles = @[@"全部", @"待付款", @"已付款",@"已结算",@"已失效",];
    
    self.categoryView = [[JXCategoryTitleView alloc] init];
    self.categoryView.delegate = self;
    [self.view addSubview:self.categoryView];
    
    self.categoryView.averageCellSpacingEnabled = YES;
    self.categoryView.titles = self.titles;
    self.categoryView.backgroundColor = UIColor.whiteColor;
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.titleFont = [UIFont systemFontOfSize:16];
    self.categoryView.titleSelectedColor = UIColor.blackColor;
    self.categoryView.titleSelectedFont = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    
    // 添加指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorWidth = 20;
    lineView.lineStyle = JXCategoryIndicatorLineStyle_Lengthen;
    lineView.indicatorColor = [UIColor colorWithHexString:@"#FF9913"];
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.categoryView.indicators = @[lineView];
    
    
}

// 时间 类型 选择View
- (void)setupSelectView {

//    self.tsView = [[TypeSelectView alloc] init];
////    [self.view addSubview:self.tsView];
//    [self.view insertSubview:self.tsView belowSubview:self.categoryView];
    
    self.tview = [[TestMyView alloc] init];
    [self.view addSubview:self.tview];
    
    
}

- (void)setupCategoryListContainerView {
    
    self.listContainerView = [[JXCategoryListContainerView alloc]
                              initWithType:JXCategoryListContainerType_ScrollView delegate:self];
//    [self.view insertSubview:self.listContainerView belowSubview:self.tsView];
//    [self.view addSubview:self.listContainerView];
    //关联到categoryView
    self.categoryView.listContainer = self.listContainerView;
    
}

//MARK: 布局 view
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view.mas_top);
        }
        make.height.mas_equalTo(50);
    }];
    [self.categoryView refreshState];// 防止categoryView不能铺满整行
    
    [self.tview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.categoryView.mas_bottom);
    }];
//    [self.tsView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.top.equalTo(self.categoryView.mas_bottom);
//    }];
    
//    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.equalTo(self.view);
//        make.top.equalTo(self.categoryView.mas_bottom).offset(40);
//    }];
    
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    //侧滑手势处理
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didScrollSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

#pragma mark - JXCategoryListContainerViewDelegate

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    IncomeDetailListController *list = [[IncomeDetailListController alloc] init];
    return list;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titles.count;
}

@end
