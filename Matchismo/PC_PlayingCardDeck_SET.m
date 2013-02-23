//
//  PC_PlayingCardDeck_SET.m
//  Matchismo FCS HWK2
//
//  Created by Fog City Solutions on 2/18/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC_PlayingCardDeck_SET.h"


@implementation PC_PlayingCardDeck_SET

// init's ALWAYS returns "id" - not "PC_PlayingCardDeck *"
-(id) init
{
	self = [super init];
	if (self)
		{
		for (NSString *validColor in [PC_PlayingCard_SET validSymbolColors])
			for (NSString *validSymbol in [PC_PlayingCard_SET validSymbols])
				for (NSString *validShading in [PC_PlayingCard_SET validSymbolShadings])
					for (NSUInteger number=1; number <= 3; number++)
					{
						PC_PlayingCard_SET *card = [[PC_PlayingCard_SET alloc] init];
						card.color = validColor;
						card.symbol = validSymbol;
						card.shading = validShading;
						card.number = number;	// number of characters on the card
						[self addCard:card atTop:YES];
					}
		}

	return self;
}


@end

