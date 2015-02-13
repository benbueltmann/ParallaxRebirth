//
//  ParallaxCollectionViewController.m
//  Parallax
//
//  Created by Ben Bueltmann on 2/12/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "ParallaxCollectionViewController.h"
#import "ParallaxFlowLayout.h"
#import "ParallaxCell.h"

@interface ParallaxCollectionViewController () <UICollectionViewDelegateFlowLayout>

@property NSArray *pics;

@end

@implementation ParallaxCollectionViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor blackColor];
    [self.collectionView registerClass:[ParallaxCell class] forCellWithReuseIdentifier:@"ParallaxID"];
}

-(id)init{
    ParallaxFlowLayout *layout = [[ParallaxFlowLayout alloc] init];
    CGFloat margin = 11;
    layout.minimumLineSpacing = margin;
    layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);

    self = [super initWithCollectionViewLayout:layout];

    if (self == nil) {
        return nil;
    }

    self.title = @"Parallax!";

    self.pics = @[[UIImage imageNamed:@"00"],
                  [UIImage imageNamed:@"01"],
                  [UIImage imageNamed:@"02"],
                  [UIImage imageNamed:@"03"],
                  [UIImage imageNamed:@"04"],
                  [UIImage imageNamed:@"05"],
                  [UIImage imageNamed:@"06"],
                  [UIImage imageNamed:@"07"],
                  [UIImage imageNamed:@"08"],
                  [UIImage imageNamed:@"09"],
                  [UIImage imageNamed:@"10"],
                  [UIImage imageNamed:@"11"],
                  [UIImage imageNamed:@"12"],
                  [UIImage imageNamed:@"13"],
                  [UIImage imageNamed:@"14"],
                  [UIImage imageNamed:@"15"],
                  [UIImage imageNamed:@"16"],
                  [UIImage imageNamed:@"17"],
                  [UIImage imageNamed:@"18"],
                  [UIImage imageNamed:@"19"],
                  [UIImage imageNamed:@"20"],
                  [UIImage imageNamed:@"21"],
                  [UIImage imageNamed:@"22"],
                  [UIImage imageNamed:@"23"],
                  [UIImage imageNamed:@"24"],
                  [UIImage imageNamed:@"25"],
                  [UIImage imageNamed:@"26"],
                  [UIImage imageNamed:@"27"],
                  [UIImage imageNamed:@"28"],
                  [UIImage imageNamed:@"29"],
                  [UIImage imageNamed:@"30"],
                  [UIImage imageNamed:@"31"]
                  ];

    return self;
}

-(id)initWithCollectionViewLayout:(UICollectionViewLayout *)layout{
    return [self init];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.pics.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ParallaxCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ParallaxID" forIndexPath:indexPath];
    UIImage *image = self.pics[indexPath.item];
    cell.imageView.image = image;

    ParallaxFlowLayout *layout = (ParallaxFlowLayout *)self.collectionViewLayout;
    cell.maxParallaxOffset = layout.maxParallaxOffset;

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *pic = self.pics[indexPath.item];
    CGFloat imageWidth = pic.size.width;
    CGFloat imageHeight = pic.size.height;

    ParallaxFlowLayout *layout = (ParallaxFlowLayout *)self.collectionViewLayout;
    CGFloat cellWidth = CGRectGetWidth(self.collectionView.bounds) - layout.sectionInset.left - layout.sectionInset.right;
    CGFloat cellHeight = floor(cellWidth / imageWidth * imageHeight) - (2 * layout.maxParallaxOffset);

    return CGSizeMake(cellWidth, cellHeight);
}

@end
