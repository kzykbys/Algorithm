//
//  BellmanFord.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/7/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BellmanFord.h"

@implementation BellmanFord

@synthesize graph;
@synthesize adj;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    // making vertices
    BellmanFordVertex *s = [[BellmanFordVertex alloc] initWithKey:'s'];
    BellmanFordVertex *t = [[BellmanFordVertex alloc] initWithKey:'t'];
    BellmanFordVertex *x = [[BellmanFordVertex alloc] initWithKey:'x'];
    BellmanFordVertex *y = [[BellmanFordVertex alloc] initWithKey:'y'];
    BellmanFordVertex *z = [[BellmanFordVertex alloc] initWithKey:'z'];
    graph = [[NSMutableArray alloc] initWithObjects:s, t, x, y, z, nil];
    
    // from 's' vertex to 't' and 'y'
    BellmanFordEdge *row0t1 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:0]
                                                                      to:[graph objectAtIndex:1]
                                                                  weight:6];
    BellmanFordEdge *row0y3 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:0]
                                                                      to:[graph objectAtIndex:3]
                                                                  weight:7];
    NSMutableArray  *row0   = [[NSMutableArray alloc] initWithObjects:row0t1, row0y3, nil];

    // from 't' vertex to 'x', 'z' and 'y'
    BellmanFordEdge *row1x1 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:1]
                                                                      to:[graph objectAtIndex:2]
                                                                  weight:5];
    BellmanFordEdge *row1z4 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:1]
                                                                      to:[graph objectAtIndex:4]
                                                                  weight:-4];
    BellmanFordEdge *row1y3 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:1]
                                                                      to:[graph objectAtIndex:3]
                                                                  weight:8];
    NSMutableArray  *row1   = [[NSMutableArray alloc] initWithObjects:row1x1, row1y3, row1z4, nil];
    
    // from 'x' vertex to 't'
    BellmanFordEdge *row2t1 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:2]
                                                                      to:[graph objectAtIndex:1]
                                                                  weight:-2];
    NSMutableArray  *row2   = [[NSMutableArray alloc] initWithObjects:row2t1, nil];

    // from 'y' vertex to 'x' and 'z'
    BellmanFordEdge *row3x2 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:3]
                                                                      to:[graph objectAtIndex:2]
                                                                  weight:-3];
    BellmanFordEdge *row3z4 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:3]
                                                                      to:[graph objectAtIndex:4]
                                                                  weight:9];
    NSMutableArray  *row3   = [[NSMutableArray alloc] initWithObjects:row3x2, row3z4, nil];
    
    // from 'z' vertex to 'x' and 's'
    BellmanFordEdge *row4x2 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:4]
                                                                      to:[graph objectAtIndex:2]
                                                                  weight:7];
    BellmanFordEdge *row4s0 = [[BellmanFordEdge alloc] initWithFromAndTo:[graph objectAtIndex:4]
                                                                      to:[graph objectAtIndex:0]
                                                                  weight:2];
    NSMutableArray  *row4   = [[NSMutableArray alloc] initWithObjects:row4s0, row4x2, nil];
    
    adj = [[NSMutableArray alloc] initWithObjects:row0, row1, row2, row3, row4, nil];
    
    return self;
}

-(BOOL)BellmanFord:(BellmanFordVertex *)s
{
    [self InitializeSingleSource:[graph objectAtIndex:0]]; // graph[0] = s
    
    for (int i = 1; i < (graph.count-1); i++)
    {
        for (int k = 0; k < adj.count; k++)
        {
            NSMutableArray *rowOfOneVertex = [adj objectAtIndex:k];
            for (int j = 0; j < rowOfOneVertex.count; j++)
            {
                BellmanFordEdge *e   = [rowOfOneVertex objectAtIndex:j];
                BellmanFordVertex *u = e.from;
                BellmanFordVertex *v = e.to;
                [self Relax:u v:v e:e];
            }
        }
    }
    
    for (int i = 0; i < adj.count; i++)
    {
        NSMutableArray *rowOfOneVertex = [adj objectAtIndex:i];
        for (int j = 0; j < rowOfOneVertex.count; j++)
        {
            BellmanFordEdge   *e = [rowOfOneVertex objectAtIndex:j];
            BellmanFordVertex *u = e.from;
            BellmanFordVertex *v = e.to;
            if (v.distance > u.distance + e.weight)
            {
                NSLog(@"Here");
                return NO;
            }
        }
        
    }
    
    return YES;
}

-(void)InitializeSingleSource:(BellmanFordVertex *)s
{
    for (int i = 0; i < graph.count; i++)
    {
        BellmanFordVertex *v = [graph objectAtIndex:i];
        v.distance           = INT_MAX;
        v.predecessor        = nil;
    }
    
    s.distance = 0;
}

-(void)Relax:(BellmanFordVertex *)u v:(BellmanFordVertex *)v e:(BellmanFordEdge *)e
{
    if (v.distance > (u.distance + e.weight))
    {
        v.distance    = u.distance + e.weight;
        v.predecessor = u;
    }
}

@end
