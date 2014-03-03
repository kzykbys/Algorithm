//
//  RandomizedSelect.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/30/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
 
Example :
    NSMutableArray *arr3 = [[NSMutableArray alloc] init];
 
    // distinct arr [3, 2, 4, 5, 10, 9, 1, 7, 8, 6]
    [arr3 addObject:[NSNumber numberWithInteger:3]];
    [arr3 addObject:[NSNumber numberWithInteger:2]];
    [arr3 addObject:[NSNumber numberWithInteger:4]];
    [arr3 addObject:[NSNumber numberWithInteger:5]];
    [arr3 addObject:[NSNumber numberWithInteger:10]];
    [arr3 addObject:[NSNumber numberWithInteger:9]];
    [arr3 addObject:[NSNumber numberWithInteger:1]];
    [arr3 addObject:[NSNumber numberWithInteger:7]];
    [arr3 addObject:[NSNumber numberWithInteger:8]];
    [arr3 addObject:[NSNumber numberWithInteger:6]];

    RandomizedSelect *randomizedSelect = [[RandomizedSelect alloc] init];
    int result = [randomizedSelect RandomizedSelect:arr3 firstIndex:0 lastIndex:9 ithTarget:1];
 
*/

#import <Foundation/Foundation.h>

@interface RandomizedSelect : NSObject

- (int)RandomizedSelect:(NSMutableArray *)arr
             firstIndex:(int)first
              lastIndex:(int)last
              ithTarget:(int)target;

- (int)RandomizedPartition:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last;

@end
