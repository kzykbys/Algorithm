
//
//  main.m
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/3/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeapSort.h"
#import "QuickSort.h"
#import "CountingSort.h"
#import "RandomizedSelect.h"
#import "InsertionSort.h"
#import "MergeSort.h"
#import "Stack.h"
#import "Queue.h"
#import "LinkedList.h"
#import "BinarySearchTree.h"
#import "RedBlackTree.h"
#import "LongestCommonSubsequence.h"
#import "HuffmanCoding.h"
#import "BTree.h"
#import "BTreeNode.h"
#import "BreadthFirstSearch.h"
#import "DepthFirstSearch.h"
#import "MinimumSpanningTreeKruskal.h"
#import "MinimumSpanningTreePrim.h"
#import "BellmanFord.h"
#import "Dijkstra.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSDate *startDate;
        NSDate *endDate;
        
        NSMutableArray *arr0 = [[NSMutableArray alloc] init];
        
        int i,n;
        srand((unsigned)time(NULL));
        for (i = 0; i < 10; i++ ) {
            n = random() % 10 + 0;
            [arr0 addObject:[NSNumber numberWithInteger:n]];
        }
        
        NSLog(@"==================================");
        startDate = [NSDate date];
        
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
        
        Dijkstra *dijkstra = [[Dijkstra alloc] init];
        NSMutableArray *arr = [dijkstra Dijkstra:dijkstra.graph[0]];
        
        
        endDate = [NSDate date];
        NSLog(@"==================================");
        
        
        // =====================================================================
        // Show Time
            NSTimeInterval interval = [endDate timeIntervalSinceDate:startDate];
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            [dateFormatter setDateFormat:@"yyyy/MM/dd HH:mm:ss.SSS"];
            NSString *dateString = [dateFormatter stringFromDate:startDate];
            NSLog(@"Start Time = %@", dateString);
            dateString = [dateFormatter stringFromDate:endDate];
            NSLog(@"End   Time = %@", dateString);
            NSLog(@"Total Time = %.3f Seconds",interval);
        // =====================================================================
        
    }
    return 0;

}



