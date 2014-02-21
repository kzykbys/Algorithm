//
//  Stack.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

    @property NSMutableArray *stack;

@end

@implementation Stack

- (id)init
{
    if (self = [super init])
    {
        self.stack = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (BOOL)Stack_Empty
{
    if ([self.stack count] == 0)
        return true;
    else
        return false;
}

- (void)Push:(int)x
{
    [self.stack addObject:[NSNumber numberWithInt:x]];
}

- (int)Pop
{
    int x = INT_MIN;
    
    if([self Stack_Empty])
    {
        NSLog(@"Error. Stack is empty");
    }
    else
    {
        x = [[self.stack objectAtIndex:[self.stack count]-1] intValue];
        [self.stack removeObjectAtIndex:[self.stack count]-1];
    }
    
    return x;
}

@end
