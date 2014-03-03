//
//  RandomizedSelect.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/30/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "RandomizedSelect.h"

@implementation RandomizedSelect

- (int)RandomizedSelect:(NSMutableArray *)arr
             firstIndex:(int)first
              lastIndex:(int)last
              ithTarget:(int)target
{
    /*
     * arr contains only one element.
     * So, i th means 1. Simply return arr[first == 1]
     */
    NSLog(@"Arr = %@", arr);
    if(first == last)
       return [[arr objectAtIndex:first] intValue];
    
    // Get pivot
    int q = [self RandomizedPartition:arr firstIndex:first lastIndex:last];
    
    // Get the number of elements in the subarr arr[first...pivot]
    int k = q - first + 1;
    
    /*
     * Checks whether arr[q] is the ith smallest element.
     * If it it, return arr[q]. the answer is pivot.
     * Otherwise, call this RandomizedSelect recursively.
     */
    if(target == k)
        return [[arr objectAtIndex:q] intValue];
    
    else if (target < k)
        return [self RandomizedSelect:arr firstIndex:first lastIndex:q-1 ithTarget:target];
    
    else
        return [self RandomizedSelect:arr firstIndex:q+1 lastIndex:last ithTarget:target-k];
    
    return target;
}


- (int)RandomizedPartition:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last
{
    srand((unsigned)time(NULL));
    // from 0 to last
    int n = random() % (last + 1) + 0;
    
    [arr exchangeObjectAtIndex:last withObjectAtIndex:n];
    
    return [self Parttion:arr firstIndex:first lastIndex:last];
}

- (int)Parttion:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last
{
    int x = [arr[last] integerValue];
    int i = first - 1;
    
    for(int j = first; j != last; j++)
    {
        if([arr[j] integerValue] <= x)
        {
            i = i + 1;
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    
    [arr exchangeObjectAtIndex:i + 1 withObjectAtIndex:last];
    
    return i + 1;
}


@end
