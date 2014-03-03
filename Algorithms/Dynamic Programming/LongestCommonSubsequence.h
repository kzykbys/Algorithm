//
//  LongestCommonSubsequence.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/16/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Example:
        LongestCommonSubsequence *LCS = [[LongestCommonSubsequence alloc] init];

        [LCS LCS_Length:@"ACCGGTCGAGTGCGCGGAAGCCGGCCGAA"
                      Y:@"GTCGTTCGGAATGCCGTTGCTCTGTAAA"];

        [LCS PrintLCS:@"ACCGGTCGAGTGCGCGGAAGCCGGCCGAA"
                    i:[@"ACCGGTCGAGTGCGCGGAAGCCGGCCGAA" length]
                    j:[@"GTCGTTCGGAATGCCGTTGCTCTGTAAA" length]];
*/

#import <Foundation/Foundation.h>

enum Direction
{
    UP = 1,     // ↑
    LEFT,       // ←
    UPPERLEFT   // ↖
};

@interface LongestCommonSubsequence : NSObject {
    NSMutableArray *c;
    NSMutableArray *b;
}

@property () NSMutableArray *c;
@property () NSMutableArray *b;

-(void)LCS_Length:(NSString *)X Y:(NSString *)Y;
-(void)PrintLCS:(NSString *)X i:(int)i j:(int)j;

@end
