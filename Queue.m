//
//  Queue.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "Queue.h"

@interface Queue ()

    @property NSMutableArray *queue;

@end

@implementation Queue

-(id)init
{
    if(self = [super init])
    {
        self.queue = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)Enqueue:(int)x
{
    [self.queue addObject:[NSNumber numberWithInt:x]];
    NSLog(@"Queue : %@", self.queue);
}

-(int)Dequeue
{
    int x = INT_MIN;
    if([self.queue count] == 0)
    {
        NSLog(@"Error. Queue is empty");
    }
    else
    {
        x = [[self.queue objectAtIndex:0] intValue];
        [self.queue removeObjectAtIndex:0];
    }
    
    NSLog(@"Queue : %@", self.queue);
    return x;
}


@end
