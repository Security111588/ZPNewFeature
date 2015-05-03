//
//  SLNewFeatureViewController.m
//  WalletSL
//
//  Created by shicuf on 15/4/4.
//  Copyright (c) 2015年 ShengLan.tec. All rights reserved.
//

#import "SLNewFeatureViewController.h"
#import "SLNewFeatureCell.h"

#define SLGuidePageCount    5

@interface SLNewFeatureViewController ()<UICollectionViewDelegate>

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation SLNewFeatureViewController

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:layout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup collection
    [self setupCollection];
    
    // setup pageControl
    [self setupPageControl];
}

- (void)setupCollection {
    // Register cell classes
    [self.collectionView registerClass:[SLNewFeatureCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
}

- (void)setupPageControl {
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.frame = CGRectMake(0, self.view.frame.size.height - 40, self.view.frame.size.width, 20);
    pageControl.numberOfPages = SLGuidePageCount;
    pageControl.pageIndicatorTintColor = [UIColor brownColor];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    pageControl.userInteractionEnabled = YES;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
    
    self.pageControl = pageControl;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return SLGuidePageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SLNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSString *imageName = [NSString stringWithFormat:@"guideBg%ld.png", indexPath.row + 1];
    cell.imageName = imageName;
    
    [cell setIndexPath:indexPath pageCount:SLGuidePageCount];
    
    return cell;
}

#pragma mark <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint currentOffset = scrollView.contentOffset;
    if(currentOffset.x<=0) {
        currentOffset.x = 0;
        scrollView.contentOffset = currentOffset;
    }
    
    NSUInteger index = round(currentOffset.x / scrollView.frame.size.width);
    self.pageControl.currentPage = index;
}

@end
