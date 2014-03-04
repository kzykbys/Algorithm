//
//  MinimumSpanningTreeKruskal.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    MinimumSpanningTreeKruskal *MSTKruskal = [[MinimumSpanningTreeKruskal alloc] init];
    [MSTKruskal MST_Kruskal];
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
      /     /   \     \
    1      9     \      5
      \           \
        8 --- 7 --- 6
 
    treeNodes will contains vertices of MST.
*/

#import <Foundation/Foundation.h>
#import "MSTKruskalVertex.h"
#import "MSTKruskaEdge.h"

@interface MinimumSpanningTreeKruskal : NSObject
{
    NSMutableArray *graph; // graph is represented usind adjacency matrix
    NSMutableArray *adj;
    NSMutableArray *treeNodes;
}

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;
@property () NSMutableArray *treeNodes;

-(id)init;
-(void)MST_Kruskal;

@end
