//
//  InsertionSort.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/28/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
     [[ InsertionSort ]]
     0.000   sec :        10 elements
     0.002   sec :       100 elements
     0.006   sec :      1000 elements
     8.268   sec :     10000 elements
     no memory   :    100000 elements
     no memory   :   1000000 elements
     no memory   :  10000000 elements
     no memory   : 100000000 elements
*/

/*
    Example :
         InsertionSort *insertionSort = [[InsertionSort alloc] init];
         arr0 = [insertionSort InsertionSort:arr0];
*/

#import <Foundation/Foundation.h>

@interface InsertionSort : NSObject

- (NSMutableArray *)InsertionSort:(NSMutableArray *)arr;

@end
