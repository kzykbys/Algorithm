//
//  InsertionSort.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/28/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

- (NSMutableArray *)InsertionSort:(NSMutableArray *)arr
{
    int i = 0;
    for(int j = 1; j != [arr count]; j++)
    {
        int key = [[arr objectAtIndex:j] intValue];
        // Insert arr[j] into the stored sequnce arr[1..j-1]
        i = j - 1;
        while (i >= 0 && [[arr objectAtIndex:i] intValue] > key)
        {
            [arr replaceObjectAtIndex:i+1
                           withObject:[NSNumber numberWithInt:[[arr objectAtIndex:i] intValue]]
             ];
            i = i - 1;
        }
        [arr replaceObjectAtIndex:i + 1
                       withObject:[NSNumber numberWithInt:key]];
    }
    return arr;
}

@end
