//
//  CountingSort.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/28/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "CountingSort.h"

@implementation CountingSort

- (NSMutableArray *)Counting_Sort:(NSMutableArray *)arr
                        resultArr:(NSMutableArray *)resultArr
                            range:(int)range
{
    NSMutableArray *tmpArr = [[NSMutableArray alloc] init];
    
    // init tmpArr
    for (int i = 0; i != range+1; i++)
    {
        [tmpArr addObject:[NSNumber numberWithInteger:0]];
    }

    // pupulate the number of elements equal to i.
    for (int j = 0; j != [arr count]; j++)
    {
        int n = [[tmpArr objectAtIndex:[[arr objectAtIndex:j] intValue]] intValue];
        [tmpArr
            replaceObjectAtIndex:[[arr objectAtIndex:j] intValue]
                      withObject:[NSNumber numberWithInteger:++n] // increment 'n'
        ];
    }
    
    // pupulate the new number of elemetns less than or equal to i
    for (int i = 1; i != range+1; i++)
    {
        int n = [[tmpArr objectAtIndex:i] intValue] + [[tmpArr objectAtIndex:i-1] intValue];
        [tmpArr
             replaceObjectAtIndex:i
             withObject:[NSNumber numberWithInt:n]
        ];
    }
    
    // sort the final arr
    for (int j = [arr count]-1; j != -1; j--)
    {
        int aj  = [[arr objectAtIndex:j] intValue];
        int caj = [[tmpArr objectAtIndex:aj] intValue];

        [resultArr
            replaceObjectAtIndex:caj-1
            withObject:[NSNumber numberWithInt:aj]
        ];
        
        [tmpArr
            replaceObjectAtIndex:aj
            withObject:[NSNumber numberWithInt:--caj]
        ];
    }
    
    return resultArr;
}


@end
