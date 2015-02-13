//
//  ParallaxCell.m
//  Parallax
//
//  Created by Ben Bueltmann on 2/12/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "ParallaxCell.h"
#import "ParallaxLayoutAttributes.h"

@interface ParallaxCell()

@property (nonatomic, strong) NSLayoutConstraint *imageViewHeightConstraint;
@property (nonatomic, strong) NSLayoutConstraint *imageViewCenterYConstraint;

@end

@implementation ParallaxCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self == nil) {
        return nil;
    }

    self.clipsToBounds = YES;

    [self setupImageView];
    [self setupConstraints];
    [self setNeedsUpdateConstraints];
    
    return self;
}


-(void)setupImageView{
    _imageView = [[UIImageView alloc]initWithImage:nil];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.contentView addSubview:_imageView];
}

-(void)setupConstraints{
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];

    self.imageViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    self.imageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem:self.imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    [self.contentView addConstraint:self.imageViewHeightConstraint];
    [self.contentView addConstraint:self.imageViewCenterYConstraint];
}

-(void)updateConstraints{
    [super updateConstraints];
    self.imageViewHeightConstraint.constant = 2 *self.maxParallaxOffset;
}

-(void)setMaxParallaxOffset:(CGFloat)maxParallaxOffset{
    _maxParallaxOffset = maxParallaxOffset;
    [self setNeedsUpdateConstraints];
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];

    NSParameterAssert(layoutAttributes != nil);
    NSParameterAssert([layoutAttributes isKindOfClass:[ParallaxLayoutAttributes class]]);

    ParallaxLayoutAttributes *parallaxLayoutAttributes = (ParallaxLayoutAttributes *)layoutAttributes;
    self.imageViewCenterYConstraint.constant = parallaxLayoutAttributes.parallaxOffset.y;
}

@end
