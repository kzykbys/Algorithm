//
//  DijkstraVertex.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "DijkstraVertex.h"

@implementation DijkstraVertex

@synthesize key;
@synthesize distance;
@synthesize predecessor;

-(id)initWithKey:(char)k
{
    if((self = [super init]) == nil) return nil;
    
    key = k;
    
    return self;
}

@end
