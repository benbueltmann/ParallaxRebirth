//
//  ParallaxLayoutAttributes.m
//  Parallax
//
//  Created by Ben Bueltmann on 2/12/15.
//  Copyright (c) 2015 Mobile Makers. All rights reserved.
//

#import "ParallaxLayoutAttributes.h"

@implementation ParallaxLayoutAttributes

-(id)copyWithZone:(NSZone *)zone{
    ParallaxLayoutAttributes *copy = [super copyWithZone:zone];
    NSAssert([copy isKindOfClass:[self class]], @"copy must have the same class");
    copy.parallaxOffset = self.parallaxOffset;
    return copy;
}

-(BOOL)isEqual:(id)object{
    if (![object isKindOfClass:[ParallaxLayoutAttributes class]]) {
        return NO;
    }

    ParallaxLayoutAttributes *otherObject = object;
    if (!CGPointEqualToPoint(self.parallaxOffset, otherObject.parallaxOffset)){
        return NO;
    }
    return [super isEqual:otherObject];
}

@end
