//
//  HuffmanCoding.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 2/17/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "HuffmanCoding.h"

@implementation HuffmanCoding

@synthesize root;
@synthesize huffmanResult;
@synthesize huffmanFreq;
@synthesize theStr;

#pragma mark -
-(id)init
{
    if ((self = [super init]) == nil) return nil;
    
    huffmanResult = [[NSMutableDictionary alloc] init];
    huffmanFreq   = [[NSMutableDictionary alloc] init];
    return self;
}

/*==============================================================
 Two main method related to Huffman Coding
 ==============================================================*/
#pragma mark - Huffman Coding

-(void)Huffman:(NSString *)targetString;
{
    theStr = targetString;
    NSMutableDictionary *dic         = [self MakeDictionary:targetString];
    NSMutableArray      *charOBJList = [self MakeCharOBJList:dic];
    [self Build_Min_Heap:charOBJList];
    
    int num =  [dic count];
    
    for(int i = 0; i < num-1; i++)
    {
        // new CharOBJ, will have merged freq
        CharOBJ *z = malloc(sizeof(CharOBJ));
        z->freq    = 0;
        z->theChar = '*';

        CharOBJ *left = malloc(sizeof(CharOBJ));
        *left  = [self Heap_Extract_Min];
        z->left  = left;
        
        CharOBJ *right = malloc(sizeof(CharOBJ));
        *right = [self Heap_Extract_Min];
        z->right = right;
        
        z->freq  = left->freq + right->freq;
        
        [self Min_Heap_Insert:*z];        
    }
    
    CharOBJ *tmp_root = malloc(sizeof(CharOBJ));
    NSValue *v = [targetArr objectAtIndex:0];
    [v getValue:tmp_root];
    root = tmp_root;
}

-(void)traverseHuffman:(CharOBJ*)tree str:(NSMutableString*)str
{
    if (tree->left == NULL && tree->right == NULL)
    {
        NSLog(@"Leaf Found : %c = %@", tree->theChar, str);
        NSString *code = [NSString stringWithFormat:@"%@", str];
        [huffmanResult setObject:code forKey:[NSString stringWithFormat:@"%c", tree->theChar]];
        [huffmanFreq   setObject:[NSNumber numberWithInt:tree->freq] forKey:[NSString stringWithFormat:@"%c", tree->theChar]];
    }
    
    if (tree->left != NULL)
    {
        [str appendFormat:@"%c", '0'];
        [self traverseHuffman:tree->left str:str];
        [str deleteCharactersInRange:NSMakeRange([str length]-1, 1)];
    }
    
    if (tree->right != NULL)
    {
        [str appendFormat:@"%c", '1'];
        [self traverseHuffman:tree->right str:str];
        [str deleteCharactersInRange:NSMakeRange([str length]-1, 1)];
    }
}

/*==================================================================
 Overwrite methods from Heapsort for Priority-Queue based on CharOBJ
 ==================================================================*/
#pragma mark - Overwrite methods from Heapsort class

-(void)Min_Heap_Insert:(CharOBJ)theCharOBJ
{
    if (heap_size != [targetArr count])
    {
        heap_size = [targetArr count];
    }
    
    heap_size++;
    
    CharOBJ *charOBJ  = malloc(sizeof(CharOBJ));
    charOBJ->freq     = INT_MAX;
    charOBJ->theChar  = theCharOBJ.theChar;
    charOBJ->left     = theCharOBJ.left;
    charOBJ->right    = theCharOBJ.right;
    NSValue *charOBJV = [NSValue value:charOBJ withObjCType:@encode(CharOBJ)];
    
    [targetArr addObject:charOBJV];
    
    [self Heap_Decrease_Key:[targetArr count]-1 key:theCharOBJ];
}

-(void)Heap_Decrease_Key:(int)i key:(CharOBJ)theCharOBJ
{
    NSValue *indexV  = [targetArr objectAtIndex:i];  // Last obj which has max
    CharOBJ indexOBJ;
    [indexV getValue:&indexOBJ];

    NSValue *parentV = [targetArr objectAtIndex:[self Parent:i]];
    CharOBJ parentOBJ;
    [parentV getValue:&parentOBJ];
    
    if (theCharOBJ.freq > indexOBJ.freq){
        NSLog(@"New key is greater than current key.");
    }
    
    // ?
    NSValue *v = [NSValue value:&theCharOBJ withObjCType:@encode(CharOBJ)];
    [targetArr removeLastObject];
    [targetArr addObject:v];
    
    while (i > 0 && parentOBJ.freq > indexOBJ.freq)
    {
        [targetArr exchangeObjectAtIndex:i withObjectAtIndex:[self Parent:i]];
        i = [self Parent:i];
        parentV = [targetArr objectAtIndex:i];
        [parentV getValue:&parentOBJ];
    }
}

-(CharOBJ)Heap_Extract_Min
{
    CharOBJ min = [self Heap_Min];
    [targetArr exchangeObjectAtIndex:0 withObjectAtIndex:[targetArr count] -1];
    [targetArr removeLastObject];
    heap_size--;
    [self Min_Heapify:0];
    
    return min;
}

-(CharOBJ)Heap_Min
{
    NSValue *minV = [targetArr objectAtIndex:0];
    CharOBJ minObj;
    [minV getValue:&minObj];
    
    return minObj;
}

-(void)Min_Heapify:(int)index
{
    int left     = [self Left:index];
    int right    = [self Right:index];
    int smallest = 0;
    
    NSValue *leftV;
    NSValue *rightV;
    NSValue *smallestV;
    NSValue *indexV;
    
    if (left < heap_size)
        leftV  = [targetArr objectAtIndex:left];
    
    if (right < heap_size)
        rightV = [targetArr objectAtIndex:right];
    
    if (heap_size != 0)
    {
        smallestV= [targetArr objectAtIndex:smallest];
        indexV = [targetArr objectAtIndex:index];
    }
    
    CharOBJ leftOBJ;
    CharOBJ rightOBJ;
    CharOBJ indexOBJ;
    CharOBJ smallestOBJ;
    
    [leftV     getValue:&leftOBJ];
    [rightV    getValue:&rightOBJ];
    [indexV    getValue:&indexOBJ];
    [smallestV getValue:&smallestOBJ];
    
    if(left < heap_size && leftOBJ.freq < indexOBJ.freq)
    {
        smallest = left;
        smallestV = [targetArr objectAtIndex:smallest];
        [smallestV getValue:&smallestOBJ];
    }else if(heap_size != 0){
        smallest = index;
        smallestV = [targetArr objectAtIndex:smallest];
        [smallestV getValue:&smallestOBJ];
    }
    
    if(right < heap_size && rightOBJ.freq < smallestOBJ.freq)
    {
        smallest = right;
        smallestV = [targetArr objectAtIndex:smallest];
        [smallestV getValue:&smallestOBJ];
    }
    
    if(smallest != index)
    {
        [targetArr exchangeObjectAtIndex:index withObjectAtIndex:smallest];
        [self Min_Heapify:smallest];
    }
}

/*==============================================================
  Three Helper methods
==============================================================*/
#pragma mark - Three Helper methods

-(NSMutableDictionary *)MakeDictionary:(NSString *)targetString
{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    
    for(int i = 0; i < [targetString length]; i++)
    {
        char theChar         = [targetString characterAtIndex:i];
        NSString *theCharObj = [NSString stringWithFormat:@"%c", theChar];
        
        if([dic objectForKey:theCharObj]) // the char is here
        {
            int v = [[dic valueForKey:theCharObj] intValue];
            v++;
            [dic setObject:[NSNumber numberWithInt:v] forKey:theCharObj];
        }
        else // the char isn't here so let's insert
        {
            [dic setObject:[NSNumber numberWithInt:1] forKey:theCharObj];
        }
    }
    
    return dic;
}

-(NSMutableArray *)MakeCharOBJList:(NSMutableDictionary *)dic
{
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    for(NSString *key in dic)
    {
        char theChar        = [key characterAtIndex:0];
        int  freq           = [[dic valueForKey:key] intValue];
        CharOBJ *c          = CharOBJMake(theChar, freq, NULL, NULL);
        NSValue *theCharOBJ = [NSValue value:c withObjCType:@encode(CharOBJ)];
        [arr addObject:theCharOBJ];
    }
    
    return  arr;
}

-(void)ShowCompressedRatio
{
    double beforeCompressedBits = [theStr length] * 8;
    double afterCompressedBits  = 0;
    
    for(NSString *key in huffmanResult)
    {
        int bitsWidth       = [[huffmanResult objectForKey:key] length];
        int freq            = [[huffmanFreq objectForKey:key] intValue];
        afterCompressedBits += bitsWidth * freq;
    }
    
    double ratio = 100 - afterCompressedBits / beforeCompressedBits * 100;
    
    NSLog(@"Before Compress  : %5.0f bits", beforeCompressedBits);
    NSLog(@"After  Compress  : %5.0f bits", afterCompressedBits);
    NSLog(@"Compressed Ratio : %5.2f %%", ratio);
}

@end

/*==============================================================
 Construct struct
 ==============================================================*/
#pragma mark - Construct struct

CharOBJ  *CharOBJMake(char theChar, int freq, CharOBJ *left, CharOBJ *right)
{
    CharOBJ *c = malloc(sizeof(CharOBJ));
    
    c->theChar = theChar;
    c->freq    = freq;
    c->left    = left;
    c->right   = right;
    
    return c;
}