//
//  MergeSort.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/30/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
     [[ MergeSort ]]
     0.000   sec :        10 elements
     0.001   sec :       100 elements
     0.041   sec :      1000 elements
     0.155   sec :     10000 elements
     1.964   sec :    100000 elements
     34.508  sec :   1000000 elements
     no memory   :  10000000 elements
     no memory   : 100000000 elements
*/

/*
    Example :
        MergeSort *mergeSort = [[MergeSort alloc] init];
        arr0 = [mergeSort MergeSort:arr0 first:0 last:[arr0 count]-1];
*/

#import <Foundation/Foundation.h>

@interface MergeSort : NSObject

- (NSMutableArray *)MergeSort:(NSMutableArray *)arr first:(int)first last:(int)last;
- (NSMutableArray *)Merge:(NSMutableArray *)arr first:(int)first midium:(int)midium last:(int)last;

@end
