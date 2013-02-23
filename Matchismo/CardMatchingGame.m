//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Fog City Solutions on 1/31/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
// @property (readwrite, nonatomic) int score; // private readwrite.
@end



@implementation CardMatchingGame

// Lazy me...
-(NSMutableArray *)mar_Cards
{		
	if (!_mar_Cards) _mar_Cards = [[NSMutableArray alloc] initWithCapacity:52];	
	return _mar_Cards;
}

//_(int)score
//{
//	return _score
//}


-(NSMutableArray *)scores
{
	if (NOT _scores)  _scores = [[NSMutableArray alloc] init];
	return _scores;
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

// 2 Card matching
-(NSString *)flipCardAtIndex:(NSUInteger)index
	{
	NSString * whatHappened;
	PCCard *flippedCard = [self cardAtIndex:index];
	if (flippedCard AND NOT flippedCard.unplayable) // does oneCard exist and not unplayable?
		{
		if (NOT flippedCard.isFaceUp) // can't flip it if it is already showwing.
			{
			for (PCCard *otherCard in self.mar_Cards)
				{
				if (otherCard.isFaceUp AND NOT otherCard.isUnplayable)
					{
					int matchScore = [flippedCard match:@[otherCard]];
					if (matchScore)
						{
						flippedCard.Unplayable = YES;
						otherCard.Unplayable = YES;
						self.score += matchScore * MATCH_BONUS;
						whatHappened = [flippedCard.contents stringByAppendingFormat:@"  & %@ matched! For %d points",otherCard.contents,matchScore * MATCH_BONUS];
						}
					else
						{
						otherCard.faceUp = NO;
						self.score -= MISMATCH_PENALTY;
						whatHappened = [flippedCard.contents stringByAppendingFormat:@"  & %@ no-match: minus %d points",otherCard.contents,MISMATCH_PENALTY];
						}
					break; // exits the for loop
					}
				}
				if (whatHappened == nil) whatHappened = [flippedCard.contents stringByAppendingFormat:@" unflipped: minus %d points",FLIP_COST];
				self.score -= FLIP_COST;
				}
			flippedCard.faceUp = NOT flippedCard.isFaceUp; // flip the card
		}
	return whatHappened;
	}



-(PCCard *)cardAtIndex:(NSUInteger)index
	{
	return (index < [self.mar_Cards count]) ? self.mar_Cards[index] : nil  ;  // iif (index<[self.mar_Cards count], self.mar_Cards[index],nil)
	}


@end
