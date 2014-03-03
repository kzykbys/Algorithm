//
//  LongestCommonSubsequence.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/16/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "LongestCommonSubsequence.h"

@implementation LongestCommonSubsequence

@synthesize c, b;

-(void)LCS_Length:(NSString *)X Y:(NSString *)Y
{
    int m = [X length];
    int n = [Y length];
    
    // clear two arrays
    [c removeAllObjects];
    [b removeAllObjects];
    
    // init two arrays based on m and n
    c = [NSMutableArray arrayWithCapacity:m + 1];
    b = [NSMutableArray arrayWithCapacity:m];
    
    // let c[0..m, 0..n] be new tables
    for (int i = 0; i < m + 1; i++)
    {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:n + 1];
        for (int k = 0; k < n + 1; k++)
        {
            [arr insertObject:[NSNumber numberWithInt:0] atIndex:k];
        }
        [c addObject:arr];
    }
    
    // let b[1..m, 1..n] be new table
    for (int i = 0; i < m; i++)
    {
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:n];
        for (int k = 0; k < n; k++)
        {
            [arr insertObject:[NSNumber numberWithInt:0] atIndex:k];
        }
        [b addObject:arr];
    }
    
    // calculate LCS
    for (int i = 1; i <= m; i++)
    {
        for(int j = 1; j <= n; j++)
        {
            char x = [X characterAtIndex:i-1];
            char y = [Y characterAtIndex:j-1];
            
            if (x == y)
            {
                c[i][j] = [NSNumber numberWithInt:([c[i-1][j-1] intValue] + 1)];
                b[i-1][j-1] = [NSNumber numberWithInt:UPPERLEFT];
            }
            else if ([c[i-1][j] intValue] >= [c[i][j-1] intValue])
            {
                c[i][j] = c[i-1][j];
                b[i-1][j-1] = [NSNumber numberWithInt:UP];
            }
            else
            {
                c[i][j] = c[i][j-1];
                b[i-1][j-1] = [NSNumber numberWithInt:LEFT];
            }
        }
    }
    
}

-(void)PrintLCS:(NSString *)X i:(int)i j:(int)j
{
    
    if (i == 0 || j == 0)
        return;
    
    if ([b[i-1][j-1] intValue] == UPPERLEFT)
    {
        [self PrintLCS:X i:i-1 j:j-1];
        NSLog(@"%c", [X characterAtIndex:i-1]);
    }
    else if ([b[i-1][j-1] intValue] == UP)
    {
        [self PrintLCS:X i:i-1 j:j];
    }
    else
    {
        [self PrintLCS:X i:i j:j-1];
    }
}

@end
