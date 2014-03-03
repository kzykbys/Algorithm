//
//  MergeSort.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/30/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

- (NSMutableArray *)MergeSort:(NSMutableArray *)arr first:(int)first last:(int)last
{
    if(first < last)
    {
        int q = (first + last) / 2;
        arr = [self MergeSort:arr first:first last:q];
        arr = [self MergeSort:arr first:q+1 last:last];
        arr = [self Merge:arr first:first midium:q last:last];
    }

    return arr;
}

- (NSMutableArray *)Merge:(NSMutableArray *)arr first:(int)first midium:(int)midium last:(int)last
{
    int n1 = midium - first + 1;
    int n2 = last   - midium;
    
    NSMutableArray *L = [[NSMutableArray alloc] init];
    NSMutableArray *R = [[NSMutableArray alloc] init];
    
    for(int i = 0; i != n1; i++)
    {
        [L addObject:[NSNumber numberWithInt:[[arr objectAtIndex:first+i] intValue]]];
    }
    
    for(int i = 0; i != n2; i++)
    {
        [R addObject:[NSNumber numberWithInt:[[arr objectAtIndex:midium+i+1] intValue]]];
    }
    
    [L addObject:[NSNumber numberWithInt:INT32_MAX]];
    [R addObject:[NSNumber numberWithInt:INT32_MAX]];
    
    int i = 0;
    int j = 0;
    
    for (int k = first; k != last+1; k++)
    {
        if ([[L objectAtIndex:i] intValue] <= [[R objectAtIndex:j] intValue])
        {
            [arr replaceObjectAtIndex:k
                           withObject:
                            [NSNumber numberWithInt:[[L objectAtIndex:i] intValue]]
            ];
            i++;
        }else
        {
            [arr replaceObjectAtIndex:k
                           withObject:
                            [NSNumber numberWithInt:[[R objectAtIndex:j] intValue]]
            ];
            j++;
        }
    }

    return arr;
}


@end
