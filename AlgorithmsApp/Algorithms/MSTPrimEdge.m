//
//  MSTPrimEdge.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/4/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "MSTPrimEdge.h"

@implementation MSTPrimEdge

@synthesize weight;
@synthesize path;
@synthesize from;
@synthesize to;

-(MSTPrimEdge *)initWithWeightAndPath:(int)w path:(bool)p from:(MSTPrimVertex *)f to:(MSTPrimVertex *)t
{
    if((self = [super init]) == nil) return nil;
    
    weight = w;
    path   = p;
    from   = f;
    to     = t;
        
    return self;
}
@end
