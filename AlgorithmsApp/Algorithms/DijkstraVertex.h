//
//  DijkstraVertex.h
//  Algorithms
//
//  Created by Kobayashi Kazuya on 3/8/14.
//  Copyright (c) 2014 Kobayashi Kazuya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DijkstraVertex : NSObject
{
    char key;
    int distance;
    DijkstraVertex *predecessor;
}

@property () char key;
@property () int distance;
@property () DijkstraVertex *predecessor;

-(id)initWithKey:(char)k;

@end
