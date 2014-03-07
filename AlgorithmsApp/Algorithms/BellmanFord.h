//
//  BellmanFord.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/7/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BellmanFordVertex.h"
#import "BellmanFordEdge.h"

/*
     BellmanFord *bellman = [[BellmanFord alloc] init];
     bool b = [bellman BellmanFord:bellman.graph[0]];
     if (b)
     {
        NSLog(@"There is NO negative-weight cycles that are reachable from the source.");
     }
     else
     {
        NSLog(@"There is negative-weight cycles that are reachable from the source.");
     }
*/
/*
    Graph:
         --  5 -->
     t  < -- -2 --  x
  6↗ | \  /– -3 –– ↗|
 s   |8  --- -4 --↘ |7
  7↘ ∨  /          ↘∨
     y  ---  9 -->  z
    
     2 < -- 4
   ↗   \   ↗
 0       -
   ↘   /   ↘
     7      -2
 
    OK. I gave up.
    Look at Algorithms/Graph/BellmanFort.png
 
 */

@interface BellmanFord : NSObject
{
    NSMutableArray *graph;
    NSMutableArray *adj;
}

-(id)init;
-(BOOL)BellmanFord:(BellmanFordVertex *)s;
-(void)InitializeSingleSource:(BellmanFordVertex *)s;
-(void)Relax:(BellmanFordVertex *)u v:(BellmanFordVertex *)v e:(BellmanFordEdge *)e;

@property () NSMutableArray *graph;
@property () NSMutableArray *adj;

@end
