//
//  BTreeNode.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/23/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BTreeNode.h"

@implementation BTreeNode

@synthesize n;
@synthesize foundKey;
@synthesize leaf;
@synthesize keys;
@synthesize children;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    n        = 0;
    foundKey = 0;
    leaf     = true;
    keys     = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 2*3 -1; ++i) // 2t - 1
    {
        [keys addObject:[NSNumber numberWithInt:0]];
    }
    children = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 2*3; ++i)    // 2t
    {
        [children addObject:[[BTreeNode alloc] initEmptyNode]];
    }
    
    return self;
}

-(BTreeNode *)initEmptyNode
{
    if((self = [super init]) == nil) return nil;
    
    n = 0;
    foundKey  = 0;
    leaf     = true;
    keys     = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 2*3 -1; ++i) // 2t - 1
    {
        [keys addObject:[NSNumber numberWithInt:0]];
    }
    children = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 2*3; ++i)    // 2t
    {
        [children addObject:[NSNull null]];
    }
    
    
    return self;
}

@end
