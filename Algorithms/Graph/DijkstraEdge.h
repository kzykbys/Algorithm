//
//  DijkstraEdge.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DijkstraVertex.h"

@interface DijkstraEdge : NSObject
{
    DijkstraVertex *from;
    DijkstraVertex *to;
    int weight;
}

@property () DijkstraVertex *from;
@property () DijkstraVertex *to;
@property () int weight;

-(id)initWithFromAndTo:(DijkstraVertex *)f to:(DijkstraVertex *)t weight:(int)w;

@end
