//
//  PC-Deck.m
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/26/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC-Deck.h"
#import "PCCard.h"

// Private
@interface PC_Deck()
	@property (strong, nonatomic) NSMutableArray *cards; // of card
@end


@implementation PC_Deck

-(NSMutableArray *)cards	// Setter - this is lasy Instantiation.
	{
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
	}


-(void)addCard:(PCCard *)card atTop:(BOOL)atTop
	{
	if (card) // card not nil?
			{
				if (atTop)
					[self.cards insertObject:card atIndex:0]; // Put the card at the top
				else
					[self.cards addObject:card];	// "addobject puts by default on the end of the array
			}
	}


 
-(PCCard *)drawRandomCard
{
	if (self.cards.count > 0)
		{
			PCCard *randomCard = nil;  // Do I really need the "=nil"?  It sets it to nil anyway, doesn't it?
			
			unsigned int index = arc4random() % self.cards.count; // non-negative number, index, -  RANDDOM, % is MOD gets the remainder of the random number divided by the count.
			randomCard = self.cards[index];	// [index] Array indexing? - this is a new notation is iOS 6.  It is really sending a message - use to be [self.card index];
			[self.cards removeObjectAtIndex:index]; // OK, got the card, remove it from the deck.
			return randomCard;
		}
		else
		return nil;
}



@end
