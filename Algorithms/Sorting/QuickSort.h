//
//  QuickSort.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/27/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
     [[ QuickSort ]]
     0.000   sec :        10 elements
     0.001   sec :       100 elements
     0.006   sec :      1000 elements
     0.082   sec :     10000 elements
     1.092   sec :    100000 elements
     24.311  sec :   1000000 elements
     no memory   :  10000000 elements
     no memory   : 100000000 elements
 */

/* 
 Example :
    QuickSort *quickSort = [[QuickSort alloc] init];
    arr0 = [quickSort QuickSort:arr0 firstIndex:0 lastIndex:[arr0 count]-1];
*/

#import <Foundation/Foundation.h>

@interface QuickSort : NSObject

- (int)Parttion:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last;
- (int)RandomizedPartition:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last;
- (NSMutableArray *)QuickSort:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last;
- (NSMutableArray *)RandomizedQuickSort:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last;


@end
