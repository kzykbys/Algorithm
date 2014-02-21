//
//  HeapSort.m
//  Algorithm
//
//  Created by Kobayashi Kazuya on 1/27/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import "HeapSort.h"

@interface HeapSort ()
@end

@implementation HeapSort

@synthesize targetArr;
@synthesize heap_size;

- (void)Max_Heapify:(int)index
{
    int left    = [self Left:index];
    int right   = [self Right:index];
    int largest = 0;
    
    if (left < heap_size && [targetArr[left] intValue] > [targetArr[index] intValue])
    {
        largest = left;
    }else{
        largest = index;
    }
    
    if(right < heap_size && [targetArr[right] intValue] > [targetArr[largest] intValue])
    {
        largest = right;
    }
    
    if(largest != index)
    {
        [targetArr exchangeObjectAtIndex:index withObjectAtIndex:largest];
        [self Max_Heapify:largest];
    }
    
}

-(void)Min_Heapify:(int)index
{
    int left  = [self Left:index];
    int right = [self Right:index];
    int smallest = 0;
    
    if(left < heap_size && [targetArr[left] intValue] < [targetArr[index] intValue])
    {
        smallest = left;
    }else{
        smallest = index;
    }
    
    if(right < heap_size && [targetArr[right] intValue] < [targetArr[smallest] intValue])
    {
        smallest = right;
    }
    
    if(smallest != index)
    {
        [targetArr exchangeObjectAtIndex:index withObjectAtIndex:smallest];
        [self Min_Heapify:smallest];
    }
}

- (void)Build_Max_Heap
{

    heap_size = [targetArr count];
    for(int i = [targetArr count] / 2; i != -1; i--)
    {
        [self Max_Heapify:i];
    }
}

-(void)Build_Min_Heap
{
    heap_size = [targetArr count];
    for(int i = [targetArr count] / 2; i != -1; i--)
    {
        [self Min_Heapify:i];
    }
}

- (void)Build_Max_Heap:(NSMutableArray *)arr
{
    targetArr = arr;
    heap_size = [targetArr count];
    for(int i = [targetArr count] / 2; i != -1; i--)
    {
        [self Max_Heapify:i];
    }
}

-(void)Build_Min_Heap:(NSMutableArray *)arr
{
    targetArr = arr;
    heap_size = [targetArr count];
    for(int i = [targetArr count] / 2; i != -1; i--)
    {
        [self Min_Heapify:i];
    }
}

- (NSMutableArray *)Heap_Sort:(NSMutableArray *)arr
{
    targetArr = arr;
    [self Build_Max_Heap];
    NSLog(@"After Build_Max_Heap = %@", targetArr);
    
    for(int i = ([targetArr count] - 1); i != 0; i--)
    {
        [targetArr exchangeObjectAtIndex:0 withObjectAtIndex:i];
        heap_size--;
        [self Max_Heapify:0];
    }
    
    return targetArr;
}

- (int)Parent:(int)index
{
    return (index - 1) / 2;
}

- (int)Left:(int) index
{
    return index * 2 + 1;
}

- (int)Right:(int) index
{
    return index * 2 + 2;
}

-(int)Heap_Min
{
    // Assume it's min-heap
    // Don't assume. Let's separate it later.
    
    return [targetArr[0] intValue];
}

- (int)Heap_Max
{
    // Assume it's max-heap
    // Don't assume. Let's separate it later.
    
    return [targetArr[0] intValue];
}

-(int)Heap_Extract_Min
{
    // Assume it's min-heap
    // Don't assume. Let's separate it later.

    int min = [self Heap_Min];
    targetArr[0] = [NSNumber numberWithInt:[targetArr[[targetArr count]-1] intValue]];
    [targetArr removeLastObject];
    heap_size--;
    [self Min_Heapify:0];
    
    return min;
}

- (int)Heap_Extract_Max
{
    // Assume it's min-heap
    // Don't assume. Let's separate it later.
    
    int max = [self Heap_Max];
    targetArr[0] = [NSNumber numberWithInt:[targetArr[[targetArr count]-1] intValue]];
    [targetArr removeLastObject];
    heap_size--;
    [self Max_Heapify:0];
    
    return max;
}

-(void)Heap_Increase_Key:(int)i key:(int)key
{
    if (key < [targetArr[i] intValue]) {
        NSLog(@"New key is smaller than current key.");
    }
    
    targetArr[i] = [NSNumber numberWithInt:key]; // from INT_MIN to key
    
    while (i > 0 && [targetArr[[self Parent:i]] intValue] < [targetArr[i] intValue])
    {
        [targetArr exchangeObjectAtIndex:i withObjectAtIndex:[self Parent:i]];
        i = [self Parent:i];
    }
}

-(void)Heap_Decrease_Key:(int)i key:(int)key
{
    if (key > [targetArr[i] intValue]){
        NSLog(@"New key is greater than current key.");
    }
               
    targetArr[i] = [NSNumber numberWithInt:key]; // from INT_MAX to key
   
    while (i > 0 && [targetArr[[self Parent:i]] intValue] > [targetArr[i] intValue])
    {
        [targetArr exchangeObjectAtIndex:i withObjectAtIndex:[self Parent:i]];
        i = [self Parent:i];
    }
}

-(void)Max_Heap_Insert:(int)key
{
    if (heap_size != [targetArr count])
    {
        heap_size = [targetArr count];
    }
    
    heap_size++;
    
    [targetArr addObject:[NSNumber numberWithInt:INT_MIN]];
    [self Heap_Increase_Key:[targetArr count]-1 key:key];
}

-(void)Min_Heap_Insert:(int)key
{
    if (heap_size != [targetArr count])
    {
        heap_size = [targetArr count];
    }
    
    heap_size++;
    
    [targetArr addObject:[NSNumber numberWithInt:INT_MAX]];
    [self Heap_Decrease_Key:[targetArr count]-1 key:key];
}

@end
