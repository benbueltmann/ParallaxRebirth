//
//  ParallaxCell.h
//  Parallax
//
//  Created by Ben Bueltmann on 2/12/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ParallaxCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic) CGFloat maxParallaxOffset;

@end
