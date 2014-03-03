//
//  DFSNode.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 3/1/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

enum DFSColor{
    DFSWHITE = 0,
    DFSBLACK,
    DFSGLAY
};


@interface DFSNode : NSObject
{
    enum DFSColor color;
    int key;
    int first;
    int finish;
    DFSNode *predecessor;
}

@property enum DFSColor color;
@property int key;
@property int first;
@property int finish;
@property DFSNode *predecessor;

@end
