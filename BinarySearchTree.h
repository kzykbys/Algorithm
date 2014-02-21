//
//  BinarySearchTree.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Example:
        BinarySearchTree *bsTree = [[BinarySearchTree alloc] init];
        BSNode *n1 = BSTreeNodeMake(10, nil, nil, nil);
        BSNode *n2 = BSTreeNodeMake(1, nil, nil, nil);
        BSNode *n3 = BSTreeNodeMake(5, nil, nil, nil);
        BSNode *n4 = BSTreeNodeMake(0, nil, nil, nil);
        [bsTree TreeInsert:n1];
        [bsTree TreeInsert:n2];
        [bsTree TreeInsert:n3];
        [bsTree TreeInsert:n4];
        NSLog(@"==================================");
        [bsTree InorderTreeWalk:bsTree.root];
        NSLog(@"==================================");
*/

#import <Foundation/Foundation.h>

typedef struct BSNode BSNode;

struct BSNode {
    int  key;
    BSNode *left;
    BSNode *right;
    BSNode *parent;
};

@interface BinarySearchTree : NSObject {
    
    BSNode *root;
    
    unsigned int size;
    
}

@property () BSNode *root;

- (id)init;
- (void)TreeInsert:(BSNode *)theNode;
- (void)InorderTreeWalk:(BSNode *)theNode;
- (BSNode *)TreeMax:(BSNode *)theNode;
- (BSNode *)TreeMin:(BSNode *)theNode;
- (BSNode *)TreeSearch:(BSNode *)theNode key:(int)key;
- (BSNode *)IterativeTreeSearch:(BSNode *)theNode key:(int)key;
- (BSNode *)TreeSuccessor:(BSNode *)theNode;
- (void)Transpant:(BSNode *)u v:(BSNode *)v;
- (void)TreeDelete:(BSNode *)theNode;

@end


BSNode * BSTreeNodeMake(int key, BSNode *left, BSNode *right, BSNode *parent);