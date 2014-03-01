//
//  BreadthFirstSearch.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BreadthFirstSearch.h"


@implementation BreadthFirstSearch

@synthesize graph;
@synthesize adj;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    graph = [[NSMutableArray alloc] init];
    adj   = [[NSMutableArray alloc] init];
    
    /*
         Graph
         1 --- 2     3 --- 4
         |     |  /  |  /  |
         5     6 --- 7 --- 8
    */
    
    NSMutableArray *vertex1Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:2],
                                                [NSNumber numberWithInt:5], nil];
    NSMutableArray *vertex2Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:1],
                                                [NSNumber numberWithInt:6], nil];
    NSMutableArray *vertex3Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:4],
                                                [NSNumber numberWithInt:6],
                                                [NSNumber numberWithInt:7], nil];
    NSMutableArray *vertex4Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:3],
                                                [NSNumber numberWithInt:7],
                                                [NSNumber numberWithInt:8], nil];
    NSMutableArray *vertex5Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:1], nil];
    NSMutableArray *vertex6Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:2],
                                                [NSNumber numberWithInt:3],
                                                [NSNumber numberWithInt:7], nil];
    NSMutableArray *vertex7Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:3],
                                                [NSNumber numberWithInt:4],
                                                [NSNumber numberWithInt:6],
                                                [NSNumber numberWithInt:8], nil];
    NSMutableArray *vertex8Adj = [NSMutableArray arrayWithObjects:
                                                [NSNumber numberWithInt:4],
                                                [NSNumber numberWithInt:7], nil];

    [adj addObject:vertex1Adj];
    [adj addObject:vertex2Adj];
    [adj addObject:vertex3Adj];
    [adj addObject:vertex4Adj];
    [adj addObject:vertex5Adj];
    [adj addObject:vertex6Adj];
    [adj addObject:vertex7Adj];
    [adj addObject:vertex8Adj];
    
    for (int i = 0; i < 8; i++) {
        BFSNode *n = [[BFSNode alloc] init];
        n.key = i + 1; // from 1 to 8
        [graph addObject:n];
    }
    
    return self;
}

-(void)BFS:(BFSNode *)sourse
{
    // Initilize vertex except for souese
    for (int i = 0; i < graph.count; i++)
    {
        if (graph[i] != sourse)
        {
            BFSNode *u = graph[i];
            u.color = BFSWHITE;
            u.distance = INT_MAX;
            u.predecessor = nil;
        }
    }
    
    // Set attr for sourse
    sourse.color = BFSGLAY;
    sourse.distance = 0;
    sourse.predecessor = nil;
    
    // Queue
    NSMutableArray *queue = [[NSMutableArray alloc] init];
    [queue addObject:sourse];
    
    while (queue.count != 0)
    {
        BFSNode *u = [queue objectAtIndex:0]; // Dequeue
        [queue removeObjectAtIndex:0];
        NSMutableArray *adjList = adj[u.key-1];
        
        for (int i = 0; i < adjList.count; i++)
        {
            int vertexKey = [[adjList objectAtIndex:i] intValue];
            BFSNode *v    = [graph objectAtIndex:vertexKey-1];
            if (v.color == BFSWHITE)
            {
                v.color       = BFSGLAY;
                v.distance    = u.distance + 1;
                v.predecessor = u;
                [queue addObject:v];
            }
        }
        u.color = BFSBLACK;
    }

}



@end
