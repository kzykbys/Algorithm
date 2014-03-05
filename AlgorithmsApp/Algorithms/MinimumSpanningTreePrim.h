//
//  MinimumSpanningTreePrim.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/4/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSTPrimVertex.h"
#import "MSTPrimEdge.h"

/*
    MinimumSpanningTreePrim *MSTPrim = [[MinimumSpanningTreePrim alloc] init];
    [MSTPrim MST_Prim:MSTPrim.graph[0]];
*/

/*
    Graph : Original
 
        2 --- 3 --- 4
      / |   /   \   | \
    1   |  9     \  |   5
      \ | /  \    \ | /
        8 --- 7 --- 6
 
    Minimum Spanning Tree :
    acyclic and connects all of the vertices.
 
        2     3 --- 4
      /      / \     \
    1      9    \     5
     \           \
      8 --- 7 --- 6
 
    Each vertex's parent propery consist MST tree.
*/


@interface MinimumSpanningTreePrim : NSObject
{
    NSMutableArray *graph; // graph is represented usind adjacency matrix
    NSMutableArray *adj;
}

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;

-(id)init;
-(void)MST_Prim:(MSTPrimVertex *)root;

@end