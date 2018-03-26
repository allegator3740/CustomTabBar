//
//  OPCustomLabel.m
//  CustomTabBar
//
//  Created by Oleg on 24.03.2018.
//  Copyright © 2018 Oleg. All rights reserved.
//

#import "OPCustomLabel.h"

@implementation OPCustomLabel


- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)] CGPath]];
    [circleLayer setStrokeColor:[[UIColor redColor] CGColor]];
    [circleLayer setFillColor:[[UIColor yellowColor] CGColor]];
    
    [[self layer] insertSublayer:circleLayer atIndex:0];

}

@end
