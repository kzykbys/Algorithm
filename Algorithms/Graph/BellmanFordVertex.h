//
//  BellmanFordVertex.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/7/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BellmanFordVertex : NSObject
{
    char key;
    int distance;
    BellmanFordVertex *predecessor;
}

@property () char key;
@property () int distance;
@property () BellmanFordVertex *predecessor;

-(id)initWithKey:(char)k;

@end
