//
//  BellmanFordEdge.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/7/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BellmanFordVertex.h"

@interface BellmanFordEdge : NSObject
{
    BellmanFordVertex *from;
    BellmanFordVertex *to;
    int weight;
}

@property () BellmanFordVertex *from;
@property () BellmanFordVertex *to;
@property () int weight;

-(id)initWithFromAndTo:(BellmanFordVertex *)f to:(BellmanFordVertex *)t weight:(int)w;

@end
