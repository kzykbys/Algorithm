//
//  MinimumSpanningTreePrim.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/4/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "MinimumSpanningTreePrim.h"

@implementation MinimumSpanningTreePrim

@synthesize graph;
@synthesize adj;

-(id)init
{
    if((self = [super init]) == nil) return nil;

    graph = [[NSMutableArray alloc] init];
    adj   = [[NSMutableArray alloc] init];

    for (int i = 0; i < 9; i++) {
        MSTPrimVertex *n = [[MSTPrimVertex alloc] init];
        n.key = i + 1; // from 1 to 9
        [graph addObject:n];
    }

    // Matrix Representation for graph
    // row a
    NSMutableArray *rowA = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Aa   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ab   = [[MSTPrimEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:0]
                                                                     to:[graph objectAtIndex:1]];
    MSTPrimEdge  *Ac   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ad   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ae   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Af   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ag   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ah   = [[MSTPrimEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:0]
                                                                     to:[graph objectAtIndex:7]];
    MSTPrimEdge  *Ai   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowA addObject:Aa];
    [rowA addObject:Ab];
    [rowA addObject:Ac];
    [rowA addObject:Ad];
    [rowA addObject:Ae];
    [rowA addObject:Af];
    [rowA addObject:Ag];
    [rowA addObject:Ah];
    [rowA addObject:Ai];
    [adj addObject:rowA];

    // row b
    NSMutableArray *rowB = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ba   = [[MSTPrimEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:1]
                                                                     to:[graph objectAtIndex:0]];
    MSTPrimEdge  *Bb   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Bc   = [[MSTPrimEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:1]
                                                                     to:[graph objectAtIndex:2]];
    MSTPrimEdge  *Bd   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Be   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Bf   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Bg   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Bh   = [[MSTPrimEdge alloc] initWithWeightAndPath:11 path:true from:[graph objectAtIndex:1]
                                                                     to:[graph objectAtIndex:7]];
    MSTPrimEdge  *Bi   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowB addObject:Ba];
    [rowB addObject:Bb];
    [rowB addObject:Bc];
    [rowB addObject:Bd];
    [rowB addObject:Be];
    [rowB addObject:Bf];
    [rowB addObject:Bg];
    [rowB addObject:Bh];
    [rowB addObject:Bi];
    [adj addObject:rowB];

    // row c
    NSMutableArray *rowC = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ca   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Cb   = [[MSTPrimEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:2]
                                                                     to:[graph objectAtIndex:1]];
    MSTPrimEdge  *Cc   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Cd   = [[MSTPrimEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:2]
                                                                     to:[graph objectAtIndex:3]];
    MSTPrimEdge  *Ce   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Cf   = [[MSTPrimEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:2]
                                                                     to:[graph objectAtIndex:5]];
    MSTPrimEdge  *Cg   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ch   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ci   = [[MSTPrimEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:2]
                                                                     to:[graph objectAtIndex:8]];
    [rowC addObject:Ca];
    [rowC addObject:Cb];
    [rowC addObject:Cc];
    [rowC addObject:Cd];
    [rowC addObject:Ce];
    [rowC addObject:Cf];
    [rowC addObject:Cg];
    [rowC addObject:Ch];
    [rowC addObject:Ci];
    [adj addObject:rowC];

    // row d
    NSMutableArray *rowD = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Da   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Db   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Dc   = [[MSTPrimEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:3]
                                                                     to:[graph objectAtIndex:2]];
    MSTPrimEdge  *Dd   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *De   = [[MSTPrimEdge alloc] initWithWeightAndPath:9 path:true  from:[graph objectAtIndex:3]
                                                                     to:[graph objectAtIndex:4]];
    MSTPrimEdge  *Df   = [[MSTPrimEdge alloc] initWithWeightAndPath:14 path:true from:[graph objectAtIndex:3]
                                                                     to:[graph objectAtIndex:5]];
    MSTPrimEdge  *Dg   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Dh   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Di   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowD addObject:Da];
    [rowD addObject:Db];
    [rowD addObject:Dc];
    [rowD addObject:Dd];
    [rowD addObject:De];
    [rowD addObject:Df];
    [rowD addObject:Dg];
    [rowD addObject:Dh];
    [rowD addObject:Di];
    [adj addObject:rowD];

    // row e
    NSMutableArray *rowE = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ea   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Eb   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ec   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ed   = [[MSTPrimEdge alloc] initWithWeightAndPath:9 path:true  from:[graph objectAtIndex:4]
                                                                     to:[graph objectAtIndex:3]];
    MSTPrimEdge  *Ee   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ef   = [[MSTPrimEdge alloc] initWithWeightAndPath:10 path:true from:[graph objectAtIndex:4]
                                                                     to:[graph objectAtIndex:5]];
    MSTPrimEdge  *Eg   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Eh   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ei   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowE addObject:Ea];
    [rowE addObject:Eb];
    [rowE addObject:Ec];
    [rowE addObject:Ed];
    [rowE addObject:Ee];
    [rowE addObject:Ef];
    [rowE addObject:Eg];
    [rowE addObject:Eh];
    [rowE addObject:Ei];
    [adj addObject:rowE];

    // row f
    NSMutableArray *rowF = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Fa   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Fb   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Fc   = [[MSTPrimEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:5]
                                                                     to:[graph objectAtIndex:2]];
    MSTPrimEdge  *Fd   = [[MSTPrimEdge alloc] initWithWeightAndPath:14 path:true from:[graph objectAtIndex:5]
                                                                     to:[graph objectAtIndex:3]];
    MSTPrimEdge  *Fe   = [[MSTPrimEdge alloc] initWithWeightAndPath:10 path:true from:[graph objectAtIndex:5]
                                                                     to:[graph objectAtIndex:4]];
    MSTPrimEdge  *Ff   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Fg   = [[MSTPrimEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:5]
                                                                     to:[graph objectAtIndex:6]];
    MSTPrimEdge  *Fh   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Fi   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowF addObject:Fa];
    [rowF addObject:Fb];
    [rowF addObject:Fc];
    [rowF addObject:Fd];
    [rowF addObject:Fe];
    [rowF addObject:Ff];
    [rowF addObject:Fg];
    [rowF addObject:Fh];
    [rowF addObject:Fi];
    [adj addObject:rowF];

    // row g
    NSMutableArray *rowG = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ga   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Gb   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Gc   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Gd   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ge   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Gf   = [[MSTPrimEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:6]
                                                                     to:[graph objectAtIndex:5]];
    MSTPrimEdge  *Gg   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Gh   = [[MSTPrimEdge alloc] initWithWeightAndPath:1 path:true  from:[graph objectAtIndex:6]
                                                                     to:[graph objectAtIndex:7]];
    MSTPrimEdge  *Gi   = [[MSTPrimEdge alloc] initWithWeightAndPath:6 path:true  from:[graph objectAtIndex:6]
                                                                     to:[graph objectAtIndex:8]];
    [rowG addObject:Ga];
    [rowG addObject:Gb];
    [rowG addObject:Gc];
    [rowG addObject:Gd];
    [rowG addObject:Ge];
    [rowG addObject:Gf];
    [rowG addObject:Gg];
    [rowG addObject:Gh];
    [rowG addObject:Gi];
    [adj addObject:rowG];

    // row h
    NSMutableArray *rowH = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ha   = [[MSTPrimEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:7]
                                                                     to:[graph objectAtIndex:0]];
    MSTPrimEdge  *Hb   = [[MSTPrimEdge alloc] initWithWeightAndPath:11 path:true from:[graph objectAtIndex:7]
                                                                     to:[graph objectAtIndex:1]];
    MSTPrimEdge  *Hc   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Hd   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *He   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Hf   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Hg   = [[MSTPrimEdge alloc] initWithWeightAndPath:1 path:true  from:[graph objectAtIndex:7]
                                                                     to:[graph objectAtIndex:6]];
    MSTPrimEdge  *Hh   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Hi   = [[MSTPrimEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:7]
                                                                     to:[graph objectAtIndex:8]];
    [rowH addObject:Ha];
    [rowH addObject:Hb];
    [rowH addObject:Hc];
    [rowH addObject:Hd];
    [rowH addObject:He];
    [rowH addObject:Hf];
    [rowH addObject:Hg];
    [rowH addObject:Hh];
    [rowH addObject:Hi];
    [adj addObject:rowH];

    // row i
    NSMutableArray *rowI = [[NSMutableArray alloc] init];
    MSTPrimEdge  *Ia   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ib   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ic   = [[MSTPrimEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:8]
                                                                     to:[graph objectAtIndex:2]];
    MSTPrimEdge  *Id   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ie   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *If   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTPrimEdge  *Ig   = [[MSTPrimEdge alloc] initWithWeightAndPath:6 path:true  from:[graph objectAtIndex:8]
                                                                     to:[graph objectAtIndex:6]];
    MSTPrimEdge  *Ih   = [[MSTPrimEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:8]
                                                                     to:[graph objectAtIndex:7]];
    MSTPrimEdge  *Ii   = [[MSTPrimEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    [rowI addObject:Ia];
    [rowI addObject:Ib];
    [rowI addObject:Ic];
    [rowI addObject:Id];
    [rowI addObject:Ie];
    [rowI addObject:If];
    [rowI addObject:Ig];
    [rowI addObject:Ih];
    [rowI addObject:Ii];
    [adj addObject:rowI];


    return self;
}

-(void)MST_Prim:(MSTPrimVertex *)root
{
    for (int i = 0; i < graph.count; i++)
    {
        MSTPrimVertex *u = [graph objectAtIndex:i];
        u.rank = INT_MAX;
        u.parent = nil;
    }
    
    root.rank = 0;
    
    // Examine edges from minimum to maximum
    NSMutableArray *edgesList = [[NSMutableArray alloc] init];
    for (int i = 0; i < adj.count; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            MSTPrimEdge *edge = [[adj objectAtIndex:i] objectAtIndex:j];
            if (edge.path)
            {
                [edgesList addObject:edge];
            }
        }
    }

    // Sort the edges of G:E into nondecreasing order by weight
    NSArray *sorted;
    sorted = [graph sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        int first  = [(MSTPrimVertex *)a rank];
        int second = [(MSTPrimVertex *)b rank];
        NSNumber *firstNum  = [NSNumber numberWithInt:first];
        NSNumber *secondNum = [NSNumber numberWithInt:second];
        return [firstNum compare:secondNum];
    }];
    
    NSMutableArray *sortedVertexList = [NSMutableArray arrayWithArray:sorted];

    while (sortedVertexList.count != 0)
    {
        MSTPrimVertex *u = [sortedVertexList objectAtIndex:0];
        [sortedVertexList removeObjectAtIndex:0];
        
        for (int i = 0; i < [[adj objectAtIndex:(u.key-1)] count]; i++)
        {
            MSTPrimEdge *e   = [[adj objectAtIndex:(u.key-1)] objectAtIndex:i];
            MSTPrimVertex *v = e.to;
            
            if (e.path)
            {
                if (e.weight < e.to.rank && [sortedVertexList containsObject:v])
                {
                    v.parent = u;
                    v.rank   = e.weight;
                    
                    NSArray *sorted;
                    sorted = [sortedVertexList sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
                        int first  = [(MSTPrimVertex *)a rank];
                        int second = [(MSTPrimVertex *)b rank];
                        NSNumber *firstNum  = [NSNumber numberWithInt:first];
                        NSNumber *secondNum = [NSNumber numberWithInt:second];
                        return [firstNum compare:secondNum];
                    }];
                    
                    [sortedVertexList removeAllObjects];
                    
                    sortedVertexList = [sorted mutableCopy];
                }
            }
        }
    }
    
}

@end
