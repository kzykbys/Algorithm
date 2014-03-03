//
//  HeapSort.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/27/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//


/*
    [[ HeapSort ]]
    0.000   sec :        10 elements
    0.001   sec :       100 elements
    0.031   sec :      1000 elements
    0.123   sec :     10000 elements
    1.918   sec :    100000 elements
    34.260  sec :   1000000 elements
    no memory   :  10000000 elements
    no memory   : 100000000 elements
 */

/*
     Example :
     
     HeapSort *heapSort = [[HeapSort alloc] init];
     arr0               = [heapSort Heap_Sort:arr0];
*/

#import <Foundation/Foundation.h>

@interface HeapSort : NSObject
{
    NSMutableArray *targetArr;
    int heap_size;

}

- (void)Max_Heapify:(int)index;
- (void)Min_Heapify:(int)index;
- (void)Build_Max_Heap;
- (void)Build_Max_Heap:(NSMutableArray *)arr;
- (void)Build_Min_Heap;
- (void)Build_Min_Heap:(NSMutableArray *)arr;
- (NSMutableArray *)Heap_Sort:(NSMutableArray *)arr;
- (int)Parent:(int)index;
- (int)Left:(int) index;
- (int)Right:(int) index;
- (int)Heap_Min;
- (int)Heap_Max;
- (int)Heap_Extract_Min;
- (int)Heap_Extract_Max;
- (void)Heap_Increase_Key:(int)i key:(int)key;
- (void)Max_Heap_Insert:(int)key;
- (void)Heap_Decrease_Key:(int)i key:(int)key;
- (void)Min_Heap_Insert:(int)key;

@property(copy) NSMutableArray *targetArr;
@property int heap_size;

@end
