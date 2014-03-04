//
//  MSTKruskaEdge.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSTKruskalVertex.h"

@interface MSTKruskaEdge : NSObject
{
    int weight;
    bool path;
    MSTKruskalVertex *from;
    MSTKruskalVertex *to;
}

@property () int weight;
@property () bool path;
@property () MSTKruskalVertex *from;
@property () MSTKruskalVertex *to;

-(MSTKruskaEdge *)initWithWeightAndPath:(int)w path:(bool)p from:(MSTKruskalVertex *)from to:(MSTKruskalVertex *)to;

@end
