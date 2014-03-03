//
//  BFSNode.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

enum BFSColor{
    BFSWHITE = 0,
    BFSBLACK,
    BFSGLAY
};

@interface BFSNode : NSObject
{
    enum BFSColor color;
    int distance;
    int key;
    BFSNode *predecessor;
}

@property enum BFSColor color;
@property int distance;
@property int key;
@property BFSNode *predecessor;

@end
