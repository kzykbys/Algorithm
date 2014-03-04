//
//  MSTKruskalNode.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/2/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSTKruskalVertex : NSObject
{
    int key;                  // uniq key in a graph
    MSTKruskalVertex *parent;
    int rank;
}

@property int key;
@property int rank;
@property MSTKruskalVertex *parent;

@end
