//
//  DepthFirstSearch.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    DepthFirstSearch *dfs = [[DepthFirstSearch alloc] init];
    [dfs DFS];
*/

/*
    Graph
    1 --> 2     3
    |   ↗ |   / |
    ∨  /  ∨ ↙   ∨
    4 <-- 5     6 < -
*/

/*
    Result
    1 -> first:1  finish:8
    2 -> first:2  finish:7
    3 -> first:9  finish:12
    4 -> first:4  finish:5
    5 -> first:3  finish:6
    6 -> first:10 finish:11
*/


#import <Foundation/Foundation.h>
#import "DFSNode.h"

@interface DepthFirstSearch : NSObject
{
    NSMutableArray *graph; // graph is represented usind adjacency list
    NSMutableArray *adj;
}

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;

-(void)DFS;
-(void)DFS_Visit:(DFSNode *)u;

@end