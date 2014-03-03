//
//  BinarySearchTree.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BinarySearchTree.h"

@implementation BinarySearchTree
@synthesize root;

- (id)init
{
    if ((self = [super init]) == nil) return nil;
    
    root = nil;
    size = 0;
    
    return self;
}


/* 
 * theNode.key   = value
 * theNode.left  = nil
 * theNode.right = right
 */

- (void)TreeInsert:(BSNode *)theNode
{
    BSNode *y = nil;
    BSNode *x = [self root];
    
    while (x != nil)
    {
        y = x;
        
        if (theNode->key < x->key)
        {
            x = x->left;
        }
        else
        {
            x = x->right;
        }
    }
    
    theNode->parent = y;
    
    if (y == nil)
    {
        self.root = theNode;
    }
    else if (theNode->key < y->key)
    {
        y->left = theNode;
    }
    else
    {
        y->right = theNode;
    }
}

- (void)InorderTreeWalk:(BSNode *)theNode
{
    if(theNode != nil)
    {
        [self InorderTreeWalk:theNode->left];
        NSLog(@"%d ", theNode->key);
        [self InorderTreeWalk:theNode->right];
    }
}

- (BSNode *)TreeMax:(BSNode *)theNode
{
    while (theNode->left != nil) {
        theNode = theNode->left;
    }
    return theNode;
}

- (BSNode *)TreeMin:(BSNode *)theNode
{
    while (theNode->right != nil) {
        theNode = theNode->right;
    }
    return theNode;
}

- (BSNode *)TreeSearch:(BSNode *)theNode key:(int)key
{
    if(theNode == nil || key == theNode->key)
    {
        return theNode;
    }
    if (key < theNode->key)
    {
        return [self TreeSearch:theNode->left key:key];
    }
    else
    {
        return [self TreeSearch:theNode->right key:key];
    }
}

- (BSNode *)IterativeTreeSearch:(BSNode *)theNode key:(int)key
{
    while (theNode != nil && key != theNode->key)
    {
        if (key < theNode->key)
        {
            theNode = theNode->left;
        }
        else
        {
            theNode = theNode->right;
        }
    }
    
    return theNode;
}

- (BSNode *)TreeSuccessor:(BSNode *)theNode
{
    if (theNode->right != nil)
        return [self TreeMin:theNode->right];
    
    BSNode *y = theNode->parent;
    while (y != nil && theNode == y->right)
    {
        theNode = y;
        y       = y->parent;
    }
    
    return y;
}

- (void)Transpant:(BSNode *)u v:(BSNode *)v
{
    if(u->parent == nil)
        self.root = v;
    else if (u == u->parent->left)
        u->parent->left = v;
    else
        u->parent->right = v;
    
    if (v != nil)
    {
        v->parent = u->parent;
    }
}

- (void)TreeDelete:(BSNode *)theNode
{
    if(theNode->left == nil)
    {
        [self Transpant:theNode v:theNode->right];
    }
    else if (theNode->right == nil)
    {
        [self Transpant:theNode v:theNode->left];
    }
    else
    {
        BSNode *y = [self TreeMin:theNode->right];
        if (y->parent != theNode)
        {
            [self Transpant:y v:y->right];
            y->right = theNode->right;
            y->right->parent = y;
        }
        [self Transpant:theNode v:y];
        y->left = theNode->left;
        y->left->parent = y;
    }    
}


@end


BSNode * BSTreeNodeMake(int key, BSNode *left, BSNode *right, BSNode* parent)
{
    BSNode *n = malloc(sizeof(BSNode));
    
    n->left   = left;
    n->right  = right;
    n->parent = parent;
    n->key    = key;
    
    return n;
};