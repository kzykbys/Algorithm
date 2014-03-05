//
//  MSTPrimVertex.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/4/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSTPrimVertex : NSObject
{
    int key;                  // uniq key in a graph
    MSTPrimVertex *parent;
    int rank;
}

@property int key;
@property int rank;
@property MSTPrimVertex *parent;

@end
