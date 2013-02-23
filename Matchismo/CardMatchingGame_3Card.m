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


#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

// Three card matching
-(NSString *)flipCardAtIndex:(NSUInteger)index
	{
		NSString *whatHappened;
		// int numCardsUp = 1;
		PCCard *flippedCard = [self cardAtIndex:index];
		PC_PlayingCard *firstCard =	nil ; //[[PCCard alloc] init];  // will get set with the first faceup card there is.
		PC_PlayingCard *secondCard = nil ; //[[PCCard alloc] init];

		if (flippedCard AND NOT flippedCard.unplayable) // does oneCard exist and not unplayable?
			{
			if (NOT flippedCard.isFaceUp) // can't flip it if it is already showing.
				{
				// Compares the flipped card to the rest of the deck.
				for (PC_PlayingCard *otherCard in self.mar_Cards)
					{
					if (otherCard.isFaceUp AND NOT otherCard.isUnplayable)
						{
						if (NOT firstCard) firstCard = otherCard;
							else secondCard = otherCard;
						}
						
					if (firstCard AND secondCard) // Both cards exist, so we have all three cards...
						{
							int curScore = self.score;
							int matchScore = [flippedCard match:@[firstCard]];
							if (matchScore) self.score += matchScore * MATCH_BONUS;
						
							matchScore = [flippedCard match:@[secondCard]];
							if (matchScore) self.score += matchScore * MATCH_BONUS;
							
							matchScore = [firstCard match:@[secondCard]];
							if (matchScore) self.score += matchScore * MATCH_BONUS;
							
							if (NOT curScore == self.score)
								whatHappened = [flippedCard.contents stringByAppendingFormat:@"  & %@ matched! For %d points",otherCard.contents,MATCH_BONUS];
							else
								{
								self.score -= MISMATCH_PENALTY;
								whatHappened = [flippedCard.contents stringByAppendingFormat:@"  & %@ no-match: minus %d points",otherCard.contents,MISMATCH_PENALTY];
								}

							flippedCard.Unplayable = YES;
							secondCard.Unplayable = YES;
							firstCard.Unplayable = YES;
						}
					}
				if (whatHappened == nil) whatHappened = [flippedCard.contents stringByAppendingFormat:@" unflipped: minus %d points",FLIP_COST];
				self.score -= FLIP_COST;
				[self.scores addObject:[NSString stringWithFormat:@" SET Game Score: %@",[NSNumber numberWithInt:self.score]]];
				}
				flippedCard.faceUp = NOT flippedCard.isFaceUp; // flip the card
			}
		return whatHappened;
	}

@end
