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

@interface IncomeDetailController ()<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) JXCategoryTitleView *categoryView;

@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@end

@implementation IncomeDetailController

// MARK: life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupCategory];
    
    [self setupCategoryListContainerView];
    
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
    self.titles = @[@"全部", @"待付款", @"已付款",@"已结算",@"已失效"];
    
    self.categoryView = [[JXCategoryTitleView alloc]
                         initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 50)];
    self.categoryView.delegate = self;
    [self.view addSubview:self.categoryView];
    
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

- (void)setupCategoryListContainerView {
    
    self.listContainerView = [[JXCategoryListContainerView alloc]
                              initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    [self.view addSubview:self.listContainerView];
    //关联到categoryView
    self.categoryView.listContainer = self.listContainerView;
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.categoryView.frame = CGRectMake(0, 88, self.view.bounds.size.width, 50);
    self.listContainerView.frame = CGRectMake(0, 88+50, self.view.bounds.size.width, self.view.bounds.size.height);
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
