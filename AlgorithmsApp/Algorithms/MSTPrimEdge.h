//
//  MSTPrimEdge.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/4/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSTPrimVertex.h"

@interface MSTPrimEdge : NSObject
{
    int weight;
    bool path;
    MSTPrimVertex *from;
    MSTPrimVertex *to;
}

@property () int weight;
@property () bool path;
@property () MSTPrimVertex *from;
@property () MSTPrimVertex *to;

-(MSTPrimEdge *)initWithWeightAndPath:(int)w path:(bool)p from:(MSTPrimVertex *)from to:(MSTPrimVertex *)to;


@end
