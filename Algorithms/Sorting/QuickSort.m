//
//  QuickSort.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/27/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

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

- (int)RandomizedPartition:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last
{
    srand((unsigned)time(NULL));
    // from 0 to last
    int n = random() % (last + 1) + 0;
    
    [arr exchangeObjectAtIndex:last withObjectAtIndex:n];
    
    return [self Parttion:arr firstIndex:first lastIndex:last];
}

- (NSMutableArray *)QuickSort:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last
{
    if(first < last)
    {
        int q = [self Parttion:arr firstIndex:first lastIndex:last];
        arr   = [self QuickSort:arr firstIndex:first lastIndex:q -1];
        arr   = [self QuickSort:arr firstIndex:q + 1 lastIndex:last];
    }
    return arr;
}

- (NSMutableArray *)RandomizedQuickSort:(NSMutableArray *)arr firstIndex:(int)first lastIndex:(int)last
{
    
    if(first < last)
    {
        int q = [self RandomizedPartition:arr firstIndex:first lastIndex:last];
        arr   = [self RandomizedQuickSort:arr firstIndex:first lastIndex:q -1];
        arr   = [self RandomizedQuickSort:arr firstIndex:q + 1 lastIndex:last];
    }
    return arr;
}

@end
