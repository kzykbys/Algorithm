//
//  MinimumSpanningTreeKruskal.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "MinimumSpanningTreeKruskal.h"

@implementation MinimumSpanningTreeKruskal

@synthesize graph;
@synthesize adj;
@synthesize treeNodes;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    graph = [[NSMutableArray alloc] init];
    adj   = [[NSMutableArray alloc] init];
    treeNodes = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 9; i++) {
        MSTKruskalVertex *n = [[MSTKruskalVertex alloc] init];
        n.key = i + 1; // from 1 to 9
        [graph addObject:n];
    }
    
    // Matrix Representation for graph
    // row a
    NSMutableArray *rowA = [[NSMutableArray alloc] init];
    MSTKruskaEdge  *Aa   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ab   = [[MSTKruskaEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:0]
                                                                                       to:[graph objectAtIndex:1]];
    MSTKruskaEdge  *Ac   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ad   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ae   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Af   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ag   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ah   = [[MSTKruskaEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:0]
                                                                                       to:[graph objectAtIndex:7]];
    MSTKruskaEdge  *Ai   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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
    MSTKruskaEdge  *Ba   = [[MSTKruskaEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:1]
                                                                                       to:[graph objectAtIndex:0]];
    MSTKruskaEdge  *Bb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Bc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:1]
                                                                                       to:[graph objectAtIndex:2]];
    MSTKruskaEdge  *Bd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Be   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Bf   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Bg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Bh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:11 path:true from:[graph objectAtIndex:1]
                                                                                       to:[graph objectAtIndex:7]];
    MSTKruskaEdge  *Bi   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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
    MSTKruskaEdge  *Ca   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Cb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:2]
                                                                                       to:[graph objectAtIndex:1]];
    MSTKruskaEdge  *Cc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Cd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:2]
                                                                                       to:[graph objectAtIndex:3]];
    MSTKruskaEdge  *Ce   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Cf   = [[MSTKruskaEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:2]
                                                                                       to:[graph objectAtIndex:5]];
    MSTKruskaEdge  *Cg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ch   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ci   = [[MSTKruskaEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:2]
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
    MSTKruskaEdge  *Da   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Db   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Dc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:3]
                                                                                       to:[graph objectAtIndex:2]];
    MSTKruskaEdge  *Dd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *De   = [[MSTKruskaEdge alloc] initWithWeightAndPath:9 path:true  from:[graph objectAtIndex:3]
                                                                                       to:[graph objectAtIndex:4]];
    MSTKruskaEdge  *Df   = [[MSTKruskaEdge alloc] initWithWeightAndPath:14 path:true from:[graph objectAtIndex:3]
                                                                                       to:[graph objectAtIndex:5]];
    MSTKruskaEdge  *Dg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Dh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Di   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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
    MSTKruskaEdge  *Ea   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Eb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ec   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ed   = [[MSTKruskaEdge alloc] initWithWeightAndPath:9 path:true  from:[graph objectAtIndex:4]
                                                                                       to:[graph objectAtIndex:3]];
    MSTKruskaEdge  *Ee   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ef   = [[MSTKruskaEdge alloc] initWithWeightAndPath:10 path:true from:[graph objectAtIndex:4]
                                                                                       to:[graph objectAtIndex:5]];
    MSTKruskaEdge  *Eg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Eh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ei   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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
    MSTKruskaEdge  *Fa   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Fb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Fc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:4 path:true  from:[graph objectAtIndex:5]
                                                                                       to:[graph objectAtIndex:2]];
    MSTKruskaEdge  *Fd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:14 path:true from:[graph objectAtIndex:5]
                                                                                       to:[graph objectAtIndex:3]];
    MSTKruskaEdge  *Fe   = [[MSTKruskaEdge alloc] initWithWeightAndPath:10 path:true from:[graph objectAtIndex:5]
                                                                                       to:[graph objectAtIndex:4]];
    MSTKruskaEdge  *Ff   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Fg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:5]
                                                                                       to:[graph objectAtIndex:6]];
    MSTKruskaEdge  *Fh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Fi   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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
    MSTKruskaEdge  *Ga   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Gb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Gc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Gd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ge   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Gf   = [[MSTKruskaEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:6]
                                                                                       to:[graph objectAtIndex:5]];
    MSTKruskaEdge  *Gg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Gh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:1 path:true  from:[graph objectAtIndex:6]
                                                                                       to:[graph objectAtIndex:7]];
    MSTKruskaEdge  *Gi   = [[MSTKruskaEdge alloc] initWithWeightAndPath:6 path:true  from:[graph objectAtIndex:6]
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
    MSTKruskaEdge  *Ha   = [[MSTKruskaEdge alloc] initWithWeightAndPath:8 path:true  from:[graph objectAtIndex:7]
                                                                                       to:[graph objectAtIndex:0]];
    MSTKruskaEdge  *Hb   = [[MSTKruskaEdge alloc] initWithWeightAndPath:11 path:true from:[graph objectAtIndex:7]
                                                                                       to:[graph objectAtIndex:1]];
    MSTKruskaEdge  *Hc   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Hd   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *He   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Hf   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Hg   = [[MSTKruskaEdge alloc] initWithWeightAndPath:1 path:true  from:[graph objectAtIndex:7]
                                                                                       to:[graph objectAtIndex:6]];
    MSTKruskaEdge  *Hh   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Hi   = [[MSTKruskaEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:7]
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
    MSTKruskaEdge  *Ia   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ib   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ic   = [[MSTKruskaEdge alloc] initWithWeightAndPath:2 path:true  from:[graph objectAtIndex:8]
                                                                                       to:[graph objectAtIndex:2]];
    MSTKruskaEdge  *Id   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ie   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *If   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
    MSTKruskaEdge  *Ig   = [[MSTKruskaEdge alloc] initWithWeightAndPath:6 path:true  from:[graph objectAtIndex:8]
                                                                                       to:[graph objectAtIndex:6]];
    MSTKruskaEdge  *Ih   = [[MSTKruskaEdge alloc] initWithWeightAndPath:7 path:true  from:[graph objectAtIndex:8]
                                                                                       to:[graph objectAtIndex:7]];
    MSTKruskaEdge  *Ii   = [[MSTKruskaEdge alloc] initWithWeightAndPath:0 path:false from:nil to:nil];
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

-(void)MST_Kruskal
{
    for (int i = 0; i < graph.count; i++)
    {
        [self Make_Set:graph[i]];
    }
    
    // Examine edges from minimum to maximum
    NSMutableArray *edgesList = [[NSMutableArray alloc] init];
    for (int i = 0; i < adj.count; i++)
    {
        for (int j = 0; j < 9; j++)
        {
            MSTKruskaEdge *edge = [[adj objectAtIndex:i] objectAtIndex:j];
            if (edge.path)
            {
                [edgesList addObject:edge];
            }
        }
    }
    
    // Sort the edges of G:E into nondecreasing order by weight
    NSArray *sortedEdgesList;
    sortedEdgesList = [edgesList sortedArrayUsingComparator:^NSComparisonResult(id a, id b) {
        int first  = [(MSTKruskaEdge *)a weight];
        int second = [(MSTKruskaEdge *)b weight];
        NSNumber *firstNum  = [NSNumber numberWithInt:first];
        NSNumber *secondNum = [NSNumber numberWithInt:second];
        return [firstNum compare:secondNum];
    }];
        
    for (int i = 0; i < sortedEdgesList.count; i++)
    {
        MSTKruskaEdge *e = [sortedEdgesList objectAtIndex:i];
        MSTKruskalVertex *a = [self Find_Set:e.from];
        MSTKruskalVertex *b = [self Find_Set:e.to];
        if (a != b)
        {
            [treeNodes addObject:e];
            [self Union:a y:b];
        }
    }
    
}

-(void)Make_Set:(MSTKruskalVertex *)x
{
    x.parent = x;
    x.rank   = 0;
}

-(MSTKruskalVertex *)Find_Set:(MSTKruskalVertex *)x
{
    if (x != x.parent)
    {
        x.parent = [self Find_Set:x.parent];
    }
    
    return  x.parent;
}

-(void)Union:(MSTKruskalVertex *)x y:(MSTKruskalVertex *)y
{
    [self Link:x y:y];
}

-(void)Link:(MSTKruskalVertex *)x y:(MSTKruskalVertex *)y
{
    if (x.rank > y.rank)
    {
        y.parent = x;
    }
    else
    {
        x.parent = y;
        if (x.rank == y.rank)
        {
            y.rank++;
        }
    }
}

@end
