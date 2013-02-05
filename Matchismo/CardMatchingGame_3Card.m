//
//  CardMatchingGame_3Card.m
//  Matchismo
//
//  Created by Fog City Solutions on 2/4/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardMatchingGame_3Card.h"
#import "PCCard.h"
#import "PC_PlayingCard.h"

@interface CardMatchingGame_3Card()
												//	@property (readwrite, nonatomic) int score; // private readwrite.
												// @property (strong, nonatomic) NSMutableArray *mar_Cards; // of Cards
@end

@implementation CardMatchingGame_3Card

// Lazy me...
//-(NSMutableArray *)mar_Cards
//{
//	if (!_mar_Cards) _mar_Cards = [[NSMutableArray alloc] initWithCapacity:52];
//	return _mar_Cards;
//}
//


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

// Three card matching
-(NSString *)flipCardAtIndex:(NSUInteger)index
{
	NSString * whatHappened;
	PCCard *flippedCard = [self cardAtIndex:index];
	if (flippedCard && !flippedCard.unplayable) // does oneCard exist and not unplayable?
		{
		if (NOT flippedCard.isFaceUp) // can't flip it if it is already showwing.
			{
			for (PCCard *otherCard in self.mar_Cards)
				{
				if (otherCard.isFaceUp AND NOT otherCard.isUnplayable)
					{
					int matchScore = [flippedCard match:@[flippedCard]];
					if (matchScore)
						{
						flippedCard.Unplayable = YES;
						otherCard.Unplayable = YES;
						self.score += matchScore * MATCH_BONUS;
						whatHappened = [flippedCard.contents stringByAppendingFormat:@"  & %@ matched! For %d points",otherCard.contents,MATCH_BONUS];
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

@end
