//
//  MSTKruskaEdge.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "MSTKruskaEdge.h"

@implementation MSTKruskaEdge

@synthesize weight;
@synthesize path;
@synthesize from;
@synthesize to;

-(MSTKruskaEdge *)initWithWeightAndPath:(int)w path:(bool)p from:(MSTKruskalVertex *)f to:(MSTKruskalVertex *)t
{
    if((self = [super init]) == nil) return nil;
    
    weight = w;
    path   = p;
    from   = f;
    to     = t;
    
    
    return self;
}

@end
