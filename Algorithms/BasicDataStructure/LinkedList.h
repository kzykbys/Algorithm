//
//  LinkedList.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/3/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//
//  Based on this github repositoty.
//  https://github.com/mschettler/NSLinkedList
//

/*
    Example:
        LinkedList *linkedList = [[LinkedList alloc] init];
        [linkedList pushFront:1];
        [linkedList pushFront:2];
        [linkedList pushFront:2];
        [linkedList pushFront:4];
        [linkedList printAllNode];
*/

#import <Foundation/Foundation.h>

typedef struct Node Node;

struct Node {
    int  key;
    Node *next;
    Node *prev;
};

@interface LinkedList : NSObject {
    
    Node *head;
    Node *tail;
    
    unsigned int size;
    
}

- (id)init;
- (Node *)searchList:(Node)theNode;
- (void)pushFront:(int)key;
- (void)removeNode:(Node *)aNode;
- (void)printAllNode;

@property (readonly) Node *head;
@property (readonly) Node *tail;

@end

Node * NodeMake(int key, Node *next, Node *prev);
