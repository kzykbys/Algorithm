//
//  HuffmanCoding.h
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/17/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

/*
    Example :
        HuffmanCoding *huff = [[HuffmanCoding alloc] init];
        [huff Huffman:@"Kazuya Kobayashi"];
        NSMutableString *str = [[NSMutableString alloc] init];
        [huff traverseHuffman:huff.root str:str];
        NSLog(@"Huffman result = %@", huff.huffmanResult);
        [huff ShowCompressedRatio];
 */

#import <Foundation/Foundation.h>
#import "HeapSort.h"

typedef struct CharOBJ CharOBJ;
struct CharOBJ {
    char theChar;
    int  freq;
    CharOBJ *left;
    CharOBJ *right;
};

@interface HuffmanCoding : HeapSort
{
    CharOBJ *root;
    NSMutableDictionary *huffmanResult;
    NSMutableDictionary *huffmanFreq;
    NSString *theStr;
}

@property () CharOBJ *root;
@property () NSMutableDictionary *huffmanResult;
@property () NSMutableDictionary *huffmanFreq;
@property () NSString *theStr;

-(void)Huffman:(NSString *)targetString;
-(void)Min_Heapify:(int)index; //override
-(CharOBJ)Heap_Min;
-(CharOBJ)Heap_Extract_Min;
-(void)Min_Heap_Insert:(CharOBJ)theCharOBJ;
-(void)Heap_Decrease_Key:(int)i key:(CharOBJ)theCharOBJ;
-(void)traverseHuffman:(CharOBJ*)tree str:(NSMutableString*)str;
-(void)ShowCompressedRatio;

@end

CharOBJ  *CharOBJMake(char theChar, int freq, CharOBJ *left, CharOBJ *right);
