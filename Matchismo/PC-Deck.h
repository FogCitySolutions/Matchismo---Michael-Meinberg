//
//  PC-Deck.h
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/26/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//


// bunch of cards

#import <Foundation/Foundation.h>
#import "PCCard.h"


@interface PC_Deck : NSObject
	// Adds a card to the deck of cards Mutable array
	-(void)	addCard:(PCCard *)card	atTop:(BOOL)atTop;
	// grabs a random card from the array
	-(PCCard *)drawRandomCard;
@end
