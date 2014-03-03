//
//  BTreeNode.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/23/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTreeNode : NSObject
{
    int n;
    int foundKey;   // For search operation
    bool leaf;
    NSMutableArray *keys;
    NSMutableArray *children;
}

@property() int n;
@property() int foundKey;
@property() bool leaf;
@property() NSMutableArray *keys;
@property() NSMutableArray *children;

-(id)init;
-(BTreeNode *)initEmptyNode;;

@end