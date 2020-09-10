//
//  TypeSelectView.m
//  QXMember
//
//  Created by iMac on 2020/9/9.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "TypeSelectView.h"
#import <Masonry/Masonry.h>

// MARK: MenuCollectionCell
@implementation MenuCollectionCell

- (UILabel *)textLabel
{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.adjustsFontSizeToFitWidth = YES;
        [self.contentView addSubview:_textLabel];
        [_textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.top.offset(0);
        }];
    }
    return _textLabel;
}

@end


// MARK: TypeSelectView
@interface TypeSelectView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger selectTimeIndex;
@property (nonatomic, assign) NSInteger selectTypeIndex;

@end


@implementation TypeSelectView

- (void)setupView {
    [self.collectionView registerClass:[MenuCollectionCell class]
            forCellWithReuseIdentifier:@"menucell"];
    [self.collectionView reloadData];
    self.backgroundColor = UIColor.clearColor;
}

// MARK: - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"menucell"
                                                                         forIndexPath:indexPath];
//    if (item.selectIndex == indexPath.row) {
//        cell.backgroundColor = hex(0xFFF5E7);
//        cell.textLabel.textColor = hex(0xFF9912);
//    } else {
//        cell.backgroundColor = kColor_F5F5F5;
//        cell.textLabel.textColor = kColor_2e2e2e;
//    }
    
//    NSArray *titles = [self currentTitleAtIndex:self.selectIndex];
    cell.textLabel.text = @"text";//titles[indexPath.row];
    return cell;
    
}

// MARK: - Collection View Flow Layout Delegate
/// cell大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/4, 45);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}


// MARK: - UICollectionViewDelegate



@end
