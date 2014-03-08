//
//  DijkstraEdge.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "DijkstraEdge.h"

@implementation DijkstraEdge

@synthesize from;
@synthesize to;
@synthesize weight;

-(id)initWithFromAndTo:(DijkstraVertex *)f to:(DijkstraVertex *)t weight:(int)w
{
    if((self = [super init]) == nil) return nil;
    
    from   = f;
    to     = t;
    weight = w;
    
    return self;
}

@end
