//
//  RedBlackTree.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/9/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "RedBlackTree.h"

@implementation RedBlackTree
@synthesize root;
@synthesize sentinel;

-(id)init
{
    if ((self = [super init]) == nil) return nil;
    
    RBNode *node = RBTreeNodeMake(100, nil, nil, nil);
    sentinel     = node;
    root         = sentinel;
    
    return self;
}

-(void)InorderRBTreeWalk:(RBNode *)theNode
{
    if(theNode != self.sentinel)
    {
        [self InorderRBTreeWalk:theNode->left];
        NSLog(@"%d ", theNode->key);
        [self InorderRBTreeWalk:theNode->right];
    }
}

-(void)LeftRotate:(RBNode *)theNode
{
    RBNode *y = theNode->right;
    theNode->right = y->left;
    if (y->left != self.sentinel)
    {
        y->left->parent = theNode;
    }
    y->parent = theNode->parent;
    if(theNode->parent == self.sentinel)
    {
        self.root = y;
    }
    else if (theNode == theNode->parent->left)
    {
        theNode->parent->left = y;
    }
    else
    {
        theNode->parent->right = y;
    }
    y->left = theNode;
    theNode->parent = y;
}

-(void)RightRotate:(RBNode *)theNode
{
    RBNode *x = theNode->left;
    theNode->left = x->right;
    if(x->right != self.sentinel)
    {
        x->right->parent = theNode;
    }
    x->parent = theNode->parent;
    if(theNode->parent == self.sentinel)
    {
        self.root = x;
    }
    else if (theNode == theNode->parent->left)
    {
        theNode->parent->left = x;
    }else
    {
        theNode->parent->right = x;
    }
    x->right = theNode;
    theNode->parent = x;
    
}

-(void)RedBlackInsert:(RBNode *)theNode
{
    RBNode *y = self.sentinel;
    RBNode *x = self.root;
    while(x != self.sentinel)
    {
        y = x;
        if(theNode->key < x->key)
        {
            x = x->left;
        }
        else
        {
            x = x->right;
        }
    }
    theNode->parent = y;
    if(y == self.sentinel)
    {
        self.root = theNode;
    }
    else if(theNode->key < y->key)
    {
        y->left = theNode;
    }
    else
    {
        y->right = theNode;
    }
    theNode->left  = self.sentinel;
    theNode->right = self.sentinel;
    theNode->color = RED;
    [self RedBlackInsertFixUP:theNode];
    
}

-(void)RedBlackInsertFixUP:(RBNode *)theNode
{
    while (theNode->parent->color == RED)
    {
        if(theNode->parent == theNode->parent->parent->left)
        {
            RBNode *y = theNode->parent->parent->right; // y is uncle.
            if(y->color == RED)
            {
                theNode->parent->color = BLACK;
                y->color = BLACK;
                theNode->parent->parent->color = RED;
                theNode = theNode->parent->parent; // move up two level
            }
            else // uncle color is black
            {
                if(theNode == theNode->parent->right)
                {
                    theNode = theNode->parent;
                    [self LeftRotate:theNode];
                }
                theNode->parent->color = BLACK;
                theNode->parent->parent->color = RED;
                [self RightRotate:theNode->parent->parent];
            }
        }
        else
        {
            RBNode *y = theNode->parent->parent->left; // y is uncle.
            if(y->color == RED)
            {
                theNode->parent->color = BLACK;
                y->color = BLACK;
                theNode->parent->parent->color = RED;
                theNode = theNode->parent->parent; // move up two level
            }
            else // uncle color is black
            {
                if(theNode == theNode->parent->left)
                {
                    theNode = theNode->parent;
                    //[self LeftRotate:theNode]; // RrightRotate?
                    [self RightRotate:theNode];
                }
                theNode->parent->color = BLACK;
                theNode->parent->parent->color = RED;
                //[self RightRotate:theNode->parent->parent]; // LeftRotate?
                [self LeftRotate:theNode->parent->parent];
            }
        }
    }
    self.root->color = BLACK;
}

-(void)RBTransplant:(RBNode *)u v:(RBNode *)v
{
    if(u->parent == self.sentinel)
    {
        self.root = v;
    }
    else if (u == u->parent->left)
    {
        u->parent->left = v;
    }
    else
    {
        u->parent->right = v;
    }

    v->parent = u->parent;
}

-(RBNode *)TreeMin:(RBNode *)theNode
{
    while (theNode->right != self.sentinel) {
        theNode = theNode->right;
    }
    return theNode;
}

-(void)RBDelete:(RBNode *)theNode
{
    RBNode *y = theNode;
    RBNode *x;
    int yColor = y->color;
    if(theNode->left == self.sentinel)
    {
        x = theNode->right;
        [self RBTransplant:theNode v:theNode->right];
    }
    else if (theNode->right == self.sentinel)
    {
        x = theNode->left;
        [self RBTransplant:theNode v:theNode->left];
    }
    else
    {
        y = [self TreeMin:theNode->right];
        yColor = y->color;
        x = y->right;
        if(y->parent == theNode)
        {
            x->parent = y;
        }
        else
        {
            [self RBTransplant:y v:y->right];
            y->right = theNode->right;
            y->right->parent = y;
        }
        [self RBTransplant:theNode v:y];
        y->left = theNode->left;
        y->left->parent = y;
        y->color = theNode->color;
    }
    if(yColor == BLACK)
    {
        [self RBDeleteFixUP:x];
    }
}

-(void)RBDeleteFixUP:(RBNode *)theNode
{
    while (theNode != self.root && theNode->color == BLACK)
    {
        if(theNode == theNode->parent->left)
        {
            RBNode *w = theNode->parent->right;
            if(w->color == RED)
            {
                w->color = BLACK;
                theNode->parent->color = RED;
                [self LeftRotate:theNode->parent];
                w = theNode->parent->right;
            }
            if(w->left->color == BLACK && w->right->color == BLACK)
            {
                w->color = RED;
                theNode = theNode->parent;
            }
            else
            {
                if (w->right->color == BLACK)
                {
                    w->left->color = BLACK;
                    w->color = RED;
                    [self RightRotate:w];
                    w = theNode->parent->right;
                }
                w->color = theNode->parent->color;
                theNode->parent->color = BLACK;
                w->right->color = BLACK;
                [self LeftRotate:theNode->parent];
                theNode = self.root;
            }
        }else
        {
            RBNode *w = theNode->parent->left;
            if(w->color == RED)
            {
                w->color = BLACK;
                theNode->parent->color = RED;
                [self RightRotate:theNode->parent];
                w = theNode->parent->left;
            }
            if(w->right->color == BLACK && w->left->color == BLACK)
            {
                w->color = RED;
                theNode = theNode->parent;
            }
            else
            {
                if (w->left->color == BLACK)
                {
                    w->right->color = BLACK;
                    w->color = RED;
                    [self LeftRotate:w];
                    w = theNode->parent->left;
                }
                w->color = theNode->parent->color;
                theNode->parent->color = BLACK;
                w->left->color = BLACK;
                [self RightRotate:theNode->parent];
                theNode = self.root;
            }
        }
    }
    theNode->color = BLACK;
}


@end

RBNode * RBTreeNodeMake(int key, RBNode *left, RBNode *right, RBNode* parent)
{
    RBNode *n = malloc(sizeof(RBNode));
    
    n->color  = BLACK;
    n->left   = left;
    n->right  = right;
    n->parent = parent;
    n->key    = key;
    
    return n;
};