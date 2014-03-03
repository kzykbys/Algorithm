//
//  RedBlackTree.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/9/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
 
 Example: 
 
    RedBlackTree *rbtree = [[RedBlackTree alloc] init];
    RBNode *n1 = RBTreeNodeMake(7,  rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n2 = RBTreeNodeMake(3,  rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n3 = RBTreeNodeMake(18, rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n4 = RBTreeNodeMake(10, rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n5 = RBTreeNodeMake(22, rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n6 = RBTreeNodeMake(8,  rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n7 = RBTreeNodeMake(11, rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);
    RBNode *n8 = RBTreeNodeMake(26, rbtree.sentinel, rbtree.sentinel, rbtree.sentinel);

    [rbtree RedBlackInsert:n1];
    [rbtree RedBlackInsert:n2];
    [rbtree RedBlackInsert:n3];
    [rbtree RedBlackInsert:n4];
    [rbtree RedBlackInsert:n5];
    [rbtree RedBlackInsert:n6];
    [rbtree RedBlackInsert:n7];
    [rbtree RedBlackInsert:n8];

    [rbtree InorderRBTreeWalk:rbtree.root];
    [rbtree RBDelete:n7];
    [rbtree InorderRBTreeWalk:rbtree.root];
*/


#import <Foundation/Foundation.h>

enum Color{
    BLACK = 0,
    RED
};

typedef struct RBNode RBNode;

struct RBNode {
    int  key;
    enum Color  color;
    RBNode *left;
    RBNode *right;
    RBNode *parent;
};

@interface RedBlackTree : NSObject {
    
    RBNode *root;
    RBNode *sentinel;
    
    unsigned int size;
    
}

@property () RBNode *root;
@property () RBNode *sentinel;

-(id)init;
-(void)InorderRBTreeWalk:(RBNode *)theNode;
-(void)LeftRotate:(RBNode *)theNode;
-(void)RightRotate:(RBNode *)theNode;
-(void)RedBlackInsert:(RBNode *)theNode;
-(void)RedBlackInsertFixUP:(RBNode *)theNode;
-(void)RBTransplant:(RBNode *)u v:(RBNode *)v;
-(RBNode *)TreeMin:(RBNode *)theNode;
-(void)RBDelete:(RBNode *)theNode;
-(void)RBDeleteFixUP:(RBNode *)theNode;

@end

RBNode * RBTreeNodeMake(int key, RBNode *left, RBNode *right, RBNode *parent);