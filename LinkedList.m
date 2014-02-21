//
//  LinkedList.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/3/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "LinkedList.h"

@implementation LinkedList
@synthesize head, tail;

- (id)init {
    
    if ((self = [super init]) == nil) return nil;
    
    head = tail = nil;
    size = 0;
    
    return self;
}

- (Node *)searchList:(Node)theNode
{
    Node *x = head;
    while (&x != NULL && x->key != theNode.key)
    {
        x = x->next;
    }
    
    return x;
}

- (void)pushFront:(int)key {
    
    Node *n = NodeMake(key, head, NULL);
    
    if (size == 0) {
        head = tail = n;
    } else {
        head->prev  = n;
        head        = n;
        n->prev     = NULL; // no need
    }
    
    size++;
}

- (void)removeNode:(Node *)aNode {
    
    if (size == 0) return;
    
    if (size == 1) {
        // delete first and only
        head = tail = nil;
    } else if (aNode->prev == nil) {
        // delete first of many
        head = head->next;
        head->prev = nil;
    } else if (aNode->next == nil) {
        // delete last
        tail = tail->prev;
        tail->next = nil;
    } else {
        // delete in the middle
        Node *tmp = aNode->prev;
        tmp->next = aNode->next;
        tmp       = aNode->next;
        tmp->prev = aNode->prev;
    }
    
    aNode->key = INT_MIN;
    free(aNode);
    size--;
    
}

- (void)printAllNode
{
    Node *x = head;
    int i = 0;
    if (size == 0)
        NSLog(@"There is no Node.");
    else
    {
        while(x != NULL)
        {
            NSLog(@"%d : %d", i, x->key);
            x = x->next;
            
            i++;
        }
        
    }
}

@end

Node * NodeMake(int key, Node *next, Node *prev)
{
    Node *n = malloc(sizeof(Node));
    
    n->next = next;
    n->prev = prev;
    n->key  = key;
    
    return n;
};