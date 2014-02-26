//
//  BTree.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/23/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "BTree.h"

@implementation BTree

@synthesize root;
@synthesize t;

-(id)init
{
    if((self = [super init]) == nil) return nil;
    
    root      = [[BTreeNode alloc] init];
    root.leaf = true; // root is leaf at this moment.
    root.n    = 0;
    t         = 3;    // Degree is 3.

    return self;
}

-(BTreeNode *)BTreeSearch:(BTreeNode *)subRootNode key:(int)key
{
    int i = 0;
    while (i < subRootNode.n && key > [[subRootNode.keys objectAtIndex:i] intValue])
    {
        i++;
    }
    if (i < subRootNode.n && key == [[subRootNode.keys objectAtIndex:i] intValue])
    {
        subRootNode.foundKey = i;
        return subRootNode;
    }
    else if (subRootNode.leaf)
    {
        return nil;
    }
    else
    {
        return [self BTreeSearch:[subRootNode.children objectAtIndex:i] key:key];
    }
}

/*
 * x is Non-full BTreeNode
 * i is index such as x.children[i] is fulls
 */

-(void)BTreeSplitChild:(BTreeNode *)x i:(int)i
{
    BTreeNode *z = [[BTreeNode alloc] init];     // z is new node
    BTreeNode *y = [x.children objectAtIndex:i]; // y is full node, which will be splited
    z.leaf       = y.leaf;
    z.n          = t - 1;   // min num of keys
    
    for (int j = 0; j < t - 1; j++)
    {
        [z.keys replaceObjectAtIndex:j
                          withObject:[y.keys objectAtIndex:j+t]
         ];
    }
    
    if(!y.leaf)
    {
        for(int j = 0; j < t; j++)
        {
            [z.children replaceObjectAtIndex:j
                                  withObject:[y.children objectAtIndex:j+t]
             ];
        }
    }
    
    y.n = t - 1;
    
    for (int j = x.n; j >= i + 1; j--)
    {
        [x.children replaceObjectAtIndex:j+1
                              withObject:[x.children objectAtIndex:j]
         ];
    }
    
    [x.children replaceObjectAtIndex:i+1 withObject:z];
    
    for (int j = x.n - 1; j >= i; j--)
    {
        [x.keys replaceObjectAtIndex:j+1
                           withObject:[x.keys objectAtIndex:j]
         ];
    }
    
    [x.keys replaceObjectAtIndex:i
                      withObject:[y.keys objectAtIndex:t-1]];
    x.n = x.n + 1;
}

-(void)BTreeInsert:(int)key
{
    BTreeNode *r = root;
    if(r.n == (2 * t - 1)) // max num of keys
    {
        BTreeNode *s = [[BTreeNode alloc] init];
        root         = s;
        s.leaf       = false;
        s.n          = 0;
        [s.children replaceObjectAtIndex:0
                              withObject:r];
        [self BTreeSplitChild:s i:0];
        [self BTreeInsertNonFull:s key:key];
    }
    else
    {
        [self BTreeInsertNonFull:r key:key];
    }
}

-(void)BTreeInsertNonFull:(BTreeNode *)x key:(int)key
{
    int i = x.n;
    i--;
    
    if(x.leaf)
    {
        if (i != -1)
        {
            
            // check if it's NSString or NSNumber
            char compared;
            if ([[x.keys objectAtIndex:i] respondsToSelector:@selector(characterAtIndex:)])
            {
                compared = [[x.keys objectAtIndex:i] characterAtIndex:0];
            }
            else
            {
                compared = [[x.keys objectAtIndex:i] intValue];
            }
            
            while (i >= 0 && key < compared)
            {
                [x.keys replaceObjectAtIndex:i+1
                                  withObject:[x.keys objectAtIndex:i]
                 ];
                
                i--;
                
                if (i != -1) {
                    // check if it's NSString or NSNumber
                    if ([[x.keys objectAtIndex:i] respondsToSelector:@selector(characterAtIndex:)])
                    {
                        compared = [[x.keys objectAtIndex:i] characterAtIndex:0];
                    }
                    else
                    {
                        compared = [[x.keys objectAtIndex:i] intValue];
                    }
                }
            }
        }
        
        [x.keys replaceObjectAtIndex:i+1
                          withObject:[NSString stringWithFormat:@"%c", key]
         ];
        
        x.n = x.n + 1;
    }
    else // internal node 
    {
        while (i >= 0 && key < [[x.keys objectAtIndex:i] characterAtIndex:0])
        {
            NSLog(@"i is decreased.");
            i--;
        }
        
        i++;
        
        BTreeNode *tmp = [x.children objectAtIndex:i];  // tmp is one of children's x
        if (tmp.n == (2 * t - 1))
        {
            [self BTreeSplitChild:x i:i];
            if (key > [[x.keys objectAtIndex:i] characterAtIndex:0])
            {
                i++;
                tmp = [x.children objectAtIndex:i];
            }
        }
        
        [self BTreeInsertNonFull:tmp key:key];
    }
}

@end
