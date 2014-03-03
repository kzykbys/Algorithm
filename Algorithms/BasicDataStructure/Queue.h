//
//  Queue.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Example:
        Queue *queue = [[Queue alloc] init];
        [queue Enqueue:3];
        [queue Dequeue];
*/

#import <Foundation/Foundation.h>

@interface Queue : NSObject

-(void)Enqueue:(int)x;
-(int)Dequeue;

@end
