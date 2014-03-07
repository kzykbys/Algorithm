//
//  BellmanFordEdge.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/7/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BellmanFordEdge.h"

@implementation BellmanFordEdge

@synthesize from;
@synthesize to;
@synthesize weight;

-(id)initWithFromAndTo:(BellmanFordVertex *)f to:(BellmanFordVertex *)t weight:(int)w
{
    if((self = [super init]) == nil) return nil;
    
    from   = f;
    to     = t;
    weight = w;
    
    return self;
}

@end
