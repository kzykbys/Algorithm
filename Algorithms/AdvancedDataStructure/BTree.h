//
//  BTree.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/23/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTreeNode.h"

/*
    BTree *tree = [[BTree alloc] init];
    [tree BTreeInsert:'A'];
    [tree BTreeInsert:'C'];
    [tree BTreeInsert:'D'];
    [tree BTreeInsert:'E'];
    [tree BTreeInsert:'J'];
    [tree BTreeInsert:'K'];
    [tree BTreeInsert:'N'];
    [tree BTreeInsert:'O'];
    [tree BTreeInsert:'R'];
    [tree BTreeInsert:'S'];
    [tree BTreeInsert:'T'];
    [tree BTreeInsert:'U'];
    [tree BTreeInsert:'V'];
    [tree BTreeInsert:'Y'];
    [tree BTreeInsert:'Z'];
    [tree BTreeInsert:'G'];
    [tree BTreeInsert:'M'];
    [tree BTreeInsert:'P'];
    [tree BTreeInsert:'X'];
    [tree BTreeInsert:'B'];
    [tree BTreeInsert:'Q'];
    [tree BTreeInsert:'L'];
    [tree BTreeInsert:'F'];

                  [O]
        [DK]              [RU]
[ABC] [EFGJ] [LMN]   [PQ] [ST] [VXYZ]
 
*/

@interface BTree : NSObject
{
    BTreeNode *root;
    int t;  /*   t  is degree
                max keys     = 2t - 1
                max children = 2t
                min keys     =  t - 1
                min children =  t
            */
}

-(id)init;
-(BTreeNode *)BTreeSearch:(BTreeNode *)root key:(int)key;
-(void)BTreeSplitChild:(BTreeNode *)x i:(int)i;
-(void)BTreeInsert:(int)key;
-(void)BTreeInsertNonFull:(BTreeNode *)x key:(int)key;


@property() BTreeNode* root;
@property() int t;

@end