//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Fog City Solutions on 1/31/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCCard.h"
#import "Deck.h"

#define NOT !
#define AND &&

@interface CardMatchingGame : NSObject

@property (readonly, nonatomic) int score; // public readonly.

// designated initializer
-(id)initWithCardCount:(NSUInteger)count
			 usingDeck:(Deck *)deck;

-(void)flipCardAtIndex:(NSUInteger)index;
-(PCCard *)cardAtIndex:(NSUInteger)index;

@end
