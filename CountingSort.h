//
//  CountingSort.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/28/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
     [[ CountingSort ]]
     0.000   sec :        10 elements
     0.001   sec :       100 elements
     0.007   sec :      1000 elements
     0.109   sec :     10000 elements
     0.856   sec :    100000 elements
     20.193  sec :   1000000 elements
     no memory   :  10000000 elements
     no memory   : 100000000 elements
 */

/*
 Example :
    + arg1  -> the array will be sorted
    + arg2  -> the result will be stored in the second array
        - arg1 and arg2 should be the same size.
    + range -> the range of input
 
    CountingSort *countingSort = [[CountingSort alloc] init];
    arr2 = [countingSort Counting_Sort:arr0 resultArr:arr2 range:10000000];
 */
#import <Foundation/Foundation.h>

@interface CountingSort : NSObject

- (NSMutableArray *)Counting_Sort:(NSMutableArray *)arr
                        resultArr:(NSMutableArray *)resultArr
                            range:(int)range;

@end
