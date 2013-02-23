//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Fog City Solutions on 1/31/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCCard.h"
#import "PC_PlayingCard.h"
#import "Deck.h"

#define NOT !
#define AND &&

@interface CardMatchingGame : NSObject

	@property (strong, nonatomic) NSMutableArray *mar_Cards; // of Cards
	@property int score; // public readonly.

	@property (nonatomic, strong) NSMutableArray *scores;

	// designated initializer
	-(id)initWithCardCount:(NSUInteger)count
				 usingDeck:(Deck *)deck;

	-(NSString *)flipCardAtIndex:(NSUInteger)index;
	-(PCCard *)cardAtIndex:(NSUInteger)index;

@end
