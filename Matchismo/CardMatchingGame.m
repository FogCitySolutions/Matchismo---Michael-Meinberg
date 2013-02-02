//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Fog City Solutions on 1/31/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

	@property (readwrite, nonatomic) int score; // private readwrite.
@property (strong, nonatomic) NSMutableArray *mar_Cards; // of Cards
@end



@implementation CardMatchingGame

// Lazy me...
-(NSMutableArray *) mar_Cards
{		
	if (!_mar_Cards) _mar_Cards = [[NSMutableArray alloc] initWithCapacity:52];	
	return _mar_Cards;
}




-(id)initWithCardCount:(NSUInteger)count
			 usingDeck:(Deck *)deck
	{
	self = [super init];
	if (self)
		{
		for (int i=0; i < count; i++)
			{
			PCCard *oneCard = [deck drawRandomCard];
	
			if (oneCard)
				self.mar_Cards[i] = oneCard;
			else
				{
				self = nil;
				break;
				}
			
			self.mar_Cards[i] = oneCard;
			}
		}
	return self;
	}


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1


-(void)flipCardAtIndex:(NSUInteger)index
	{
	PCCard *oneCard = [self cardAtIndex:index];
	if (oneCard AND NOT oneCard.unplayable) // does oneCard exist and not unplayable?
		{
		if (NOT oneCard.isFaceUp)
			{
			for (PCCard *otherCard in self.mar_Cards)
				{
				if (otherCard.isFaceUp AND NOT otherCard.isUnplayable)
					{
					int matchScore = [oneCard match:@[oneCard]];
					if (matchScore)
						{
						oneCard.Unplayable = YES;
						otherCard.Unplayable = YES;
						self.score += matchScore * MATCH_BONUS;
						}
					else
						{
						otherCard.faceUp = NO;
						self.score -= MISMATCH_PENALTY;
						} // if matchScore
					break;
					}  // if otherCard
				}  // for loop
				self.score -= FLIP_COST;
				oneCard.faceUp = NOT oneCard.faceUp; // flip the card
			} // if NOT oneCard
		} // if oneCard and NOT ...
	} // flip method




-(PCCard *)cardAtIndex:(NSUInteger)index
	{
	return (index < [self.mar_Cards count]) ? self.mar_Cards[index] : nil  ;  // iif (index<[self.mar_Cards count], self.mar_Cards[index],nil)
	}


@end
