//
//  DepthFirstSearch.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "DepthFirstSearch.h"

@implementation DepthFirstSearch

@synthesize graph;
@synthesize adj;

static int timeDFS = 0;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    graph = [[NSMutableArray alloc] init];
    adj   = [[NSMutableArray alloc] init];
    
    /*
     Graph
     1 --> 2     3
     |   ↗ |   / |
     ∨  /  ∨ ↙   ∨
     4 <-- 5     6 < -
     */
    
    NSMutableArray *vertex1Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:2],
                                  [NSNumber numberWithInt:4], nil];
    NSMutableArray *vertex2Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:5], nil];
    NSMutableArray *vertex3Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:5],
                                  [NSNumber numberWithInt:6], nil];
    NSMutableArray *vertex4Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:2], nil];
    NSMutableArray *vertex5Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:4], nil];
    NSMutableArray *vertex6Adj = [NSMutableArray arrayWithObjects:
                                  [NSNumber numberWithInt:6], nil];
    
    [adj addObject:vertex1Adj];
    [adj addObject:vertex2Adj];
    [adj addObject:vertex3Adj];
    [adj addObject:vertex4Adj];
    [adj addObject:vertex5Adj];
    [adj addObject:vertex6Adj];
    
    for (int i = 0; i < 6; i++) {
        DFSNode *n = [[DFSNode alloc] init];
        n.key = i + 1; // from 1 to 8
        [graph addObject:n];
    }
    
    return self;
}

-(void)DFS
{
    for (int i = 0; i < graph.count; i++)
    {
        DFSNode *u = [graph objectAtIndex:i];
        u.color = DFSWHITE;
        u.predecessor = nil;
    }
    
    timeDFS = 0;
    
    for (int i = 0; i < graph.count; i++)
    {
        DFSNode *u = [graph objectAtIndex:i];
        if (u.color == DFSWHITE)
        {
            [self DFS_Visit:u];
        }
    }
}

-(void)DFS_Visit:(DFSNode *)u
{
    timeDFS++;
    u.first = timeDFS;
    u.color = DFSGLAY;

    NSMutableArray *adjList = adj[u.key-1];
    for (int i = 0; i < adjList.count; i++)
    {
        int verteKey = [[adjList objectAtIndex:i] intValue];
        DFSNode *v = [graph objectAtIndex:verteKey-1];

        if (v.color == DFSWHITE)
        {
            v.predecessor = u;
            [self DFS_Visit:v];
        }
    }
    u.color = DFSBLACK;
    timeDFS++;
    u.finish = timeDFS;
}



@end
