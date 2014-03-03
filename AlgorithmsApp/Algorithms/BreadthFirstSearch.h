//
//  BreadthFirstSearch.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    BreadthFirstSearch *bfs = [[BreadthFirstSearch alloc] init];
    [bfs BFS:bfs.graph[1]]; // pass number 2 vartex
*/

/*
     Graph
     1 --- 2     3 --- 4
     |     |  /  |  /  |
     5     6 --- 7 --- 8
*/


#import <Foundation/Foundation.h>
#import "BFSNode.h"

@interface BreadthFirstSearch : NSObject
{
    NSMutableArray *graph; // graph is represented usind adjacency list
    NSMutableArray *adj;
}

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;

-(id)init;
-(void)BFS:(BFSNode *)sourse;

@end
