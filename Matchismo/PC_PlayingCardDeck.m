//
//  PC_PlayingCardDeck.m
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/28/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC_PlayingCardDeck.h"
#import "PC_PlayingCard.h"

@implementation PC_PlayingCardDeck

// init's ALWAYS returns "id" - not "PC_PlayingCardDeck *"
-(id) init
	{
		self = [super init];
		if (self)
			{
			for (NSString *vld_suit in [PC_PlayingCard validSuits])
				{
					for (NSUInteger n_rank=1; n_rank <= [PC_PlayingCard maxRank]; n_rank++)
					{
					PC_PlayingCard *card = [[PC_PlayingCard alloc] init];
					card.rank = n_rank;
					card.suit = vld_suit;
					[self addCard:card atTop:YES];
					}
				}
			}
	return self;
	}

@end
