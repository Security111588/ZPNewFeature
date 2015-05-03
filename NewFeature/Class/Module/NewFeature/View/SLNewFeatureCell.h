//
//  SLNewFeatureCell.h
//  WalletSL
//
//  Created by shicuf on 15/4/7.
//  Copyright (c) 2015年 ShengLan.tec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLNewFeatureCell : UICollectionViewCell

@property (nonatomic, copy) NSString *imageName;

- (void)setIndexPath:(NSIndexPath *)indexPath pageCount:(NSInteger)count;

@end
