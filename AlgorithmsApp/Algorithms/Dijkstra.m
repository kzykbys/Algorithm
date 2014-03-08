//
//  Dijkstra.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "Dijkstra.h"

@implementation Dijkstra

@synthesize graph;
@synthesize adj;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    // making vertices
    DijkstraVertex *s = [[DijkstraVertex alloc] initWithKey:'s'];
    DijkstraVertex *t = [[DijkstraVertex alloc] initWithKey:'t'];
    DijkstraVertex *x = [[DijkstraVertex alloc] initWithKey:'x'];
    DijkstraVertex *y = [[DijkstraVertex alloc] initWithKey:'y'];
    DijkstraVertex *z = [[DijkstraVertex alloc] initWithKey:'z'];
    graph = [[NSMutableArray alloc] initWithObjects:s, t, x, y, z, nil];

    // from 's' vertex to 't' and 'y'
    DijkstraEdge *row0t1 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:0]
                                                                to:[graph objectAtIndex:1]
                                                            weight:10];
    DijkstraEdge *row0y3 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:0]
                                                                to:[graph objectAtIndex:3]
                                                            weight:5];
    NSMutableArray  *row0   = [[NSMutableArray alloc] initWithObjects:row0t1, row0y3, nil];
    
    // from 't' vertex to 'x' and 'y'
    DijkstraEdge *row1x2 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:1]
                                                                to:[graph objectAtIndex:2]
                                                            weight:1];
    DijkstraEdge *row1y3 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:1]
                                                                to:[graph objectAtIndex:3]
                                                            weight:2];
    NSMutableArray  *row1   = [[NSMutableArray alloc] initWithObjects:row1x2, row1y3, nil];

    // from 'x' vertex to 'z'
    DijkstraEdge *row2z4 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:2]
                                                                to:[graph objectAtIndex:4]
                                                            weight:4];
    NSMutableArray  *row2   = [[NSMutableArray alloc] initWithObjects:row2z4, nil];
    
    // from 'y' vertex to 't', 'x' and 'z'
    DijkstraEdge *row3t1 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:3]
                                                                to:[graph objectAtIndex:1]
                                                            weight:3];
    DijkstraEdge *row3x2 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:3]
                                                                to:[graph objectAtIndex:2]
                                                            weight:9];
    DijkstraEdge *row3z4 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:3]
                                                                to:[graph objectAtIndex:4]
                                                            weight:2];
    NSMutableArray  *row3   = [[NSMutableArray alloc] initWithObjects:row3t1, row3x2, row3z4, nil];
    
    // from 'z' vertex to 's' and 'x'
    DijkstraEdge *row4s0 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:4]
                                                                to:[graph objectAtIndex:0]
                                                            weight:7];
    DijkstraEdge *row4x2 = [[DijkstraEdge alloc] initWithFromAndTo:[graph objectAtIndex:4]
                                                                to:[graph objectAtIndex:0]
                                                            weight:6];
    NSMutableArray  *row4   = [[NSMutableArray alloc] initWithObjects:row4s0, row4x2, nil];

    adj = [[NSMutableArray alloc] initWithObjects:row0, row1, row2, row3, row4, nil];
    
    return self;
}

-(NSMutableArray *)Dijkstra:(DijkstraVertex *)s
{
    [self InitializeSingleSource:[graph objectAtIndex:0]]; // graph[0] = s
    
    NSMutableArray *shortestSet = [[NSMutableArray alloc] init];
    
    NSArray *sorted;
    sorted = [graph sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        int first  = [(DijkstraVertex *)a distance];
        int second = [(DijkstraVertex *)b distance];
        NSNumber *firstNum  = [NSNumber numberWithInt:first];
        NSNumber *secondNum = [NSNumber numberWithInt:second];
        return [firstNum compare:secondNum];
    }];
    
    NSMutableArray *sortedVertexList = [NSMutableArray arrayWithArray:sorted];
    
    while (sortedVertexList.count != 0)
    {
        DijkstraVertex *u = [sortedVertexList objectAtIndex:0];
        [sortedVertexList removeObjectAtIndex:0];
        
        [shortestSet addObject:u];
        
        NSMutableArray *adjEdgeList = [self findAdj:u];
        for (int i = 0; i < adjEdgeList.count; i++)
        {
            DijkstraEdge   *e = [adjEdgeList objectAtIndex:i];
            DijkstraVertex *u = e.from;
            DijkstraVertex *v = e.to;
            [self Relax:u v:v e:e];
        }
        
        NSArray *sorted;
        sorted = [sortedVertexList sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
            int first  = [(DijkstraVertex *)a distance];
            int second = [(DijkstraVertex *)b distance];
            NSNumber *firstNum  = [NSNumber numberWithInt:first];
            NSNumber *secondNum = [NSNumber numberWithInt:second];
            return [firstNum compare:secondNum];
        }];
        
        [sortedVertexList removeAllObjects];
        
        sortedVertexList = [sorted mutableCopy];
    }        
    
    return shortestSet;
}

-(void)InitializeSingleSource:(DijkstraVertex *)s
{
    for (int i = 0; i < graph.count; i++)
    {
        DijkstraVertex *v = [graph objectAtIndex:i];
        v.distance           = INT_MAX;
        v.predecessor        = nil;
    }
    
    s.distance = 0;
}

-(void)Relax:(DijkstraVertex *)u v:(DijkstraVertex *)v e:(DijkstraEdge *)e
{
    if (v.distance > (u.distance + e.weight))
    {
        v.distance    = u.distance + e.weight;
        v.predecessor = u;
    }
}

-(NSMutableArray *)findAdj:(DijkstraVertex *)u
{
    int index = 0;
    switch (u.key)
    {
        case 's':
            index = 0;
            break;
        case 't':
            index = 1;
            break;
        case 'x':
            index = 2;
            break;
        case 'y':
            index = 3;
            break;
        case 'z':
            index = 4;
            break;
        default:
            break;
    }
    
    NSMutableArray *list = [NSMutableArray arrayWithArray:[adj objectAtIndex:index]];
    
    return list;
}

@end
