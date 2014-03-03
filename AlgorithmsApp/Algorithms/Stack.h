//
//  Stack.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Example:
        Stack *stack = [[Stack alloc] init];
        [stack Push:4];
        NSLog(@"My stack : %@", stack);
        [stack Push:5];
        NSLog(@"My stack : %@", stack);
        [stack Push:1];
        NSLog(@"My stack : %@", stack);
        [stack Pop];
        NSLog(@"My stack : %@", stack);
        [stack Pop];
        NSLog(@"My stack : %@", stack);
        [stack Pop];
        NSLog(@"My stack : %@", stack);
        [stack Pop];
 */

#import <Foundation/Foundation.h>

@interface Stack : NSObject

- (BOOL)Stack_Empty;
- (void)Push:(int)x;
- (int)Pop;

@end
