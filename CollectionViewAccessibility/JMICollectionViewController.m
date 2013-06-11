//
//  JMICollectionViewController.m
//  CollectionViewAccessibility
//
//  Created by Jose Ibanez on 4/29/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JMICollectionViewController.h"
#import "JMICollectionViewCell.h"
#import "JMICollectionReusableView.h"
#import "JMIAccessibleCollectionView.h"

@interface JMICollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation JMICollectionViewController

static NSString * const kCellIdentifier = @"cellIdentifier";
static NSString * const kHeaderIdentifier = @"headerIdentifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(0.0, 50.0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(5.0, 0.0, 5.0, 0.0);
    self.collectionView = [[JMIAccessibleCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.collectionView registerClass:[JMICollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier];
    [self.collectionView registerClass:[JMICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // 5 sections
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // random number between 10 and 20.
    return arc4random_uniform(10) + 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JMICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    JMICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
    header.label.text = [NSString stringWithFormat:@"%d", indexPath.section];
    return header;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 50 x random(50 - 150)
    return CGSizeMake(50.0, arc4random_uniform(100) + 50.0);
}


@end
