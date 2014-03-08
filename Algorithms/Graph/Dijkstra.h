//
//  Dijkstra.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Dijkstra *dijkstra = [[Dijkstra alloc] init];
    NSMutableArray *arr = [dijkstra Dijkstra:dijkstra.graph[0]];
*/

/*
    Graph
    Look at Algorithms/Graph/Dijkstra.png
*/

#import <Foundation/Foundation.h>
#import "DijkstraVertex.h"
#import "DijkstraEdge.h"

@interface Dijkstra : NSObject
{
    NSMutableArray *graph;
    NSMutableArray *adj;
}

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;

-(id)init;
-(NSMutableArray *)Dijkstra:(DijkstraVertex *)s;
-(void)InitializeSingleSource:(DijkstraVertex *)s;
-(void)Relax:(DijkstraVertex *)u v:(DijkstraVertex *)v e:(DijkstraEdge *)e;

@end
