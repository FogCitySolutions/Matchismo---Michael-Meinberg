//
//  PC_PlayingCard.m
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/27/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC_PlayingCard.h"

@implementation PC_PlayingCard
@synthesize suit = _suit; // Have to this - becuase we implemented BOTH the setter and the getter.


+ (NSArray *)validSuits
{
	return @[@"♥",@"♦",@"♠",@"♣"];
}


// suit SETTER
-(void) setSuit:(NSString *)suit
{
	// 	if ( [@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit] ) replaced with line below -
	if ( [[PC_PlayingCard validSuits] containsObject:suit] ) // using the class method above - the first part returns an array of valid suits (really this could have been an instance method)
		{
		_suit = suit;
		}
}

// suit getter
-(NSString *)suit
{
	return _suit ? _suit: @"?";		// -suit is nil?  Return @"?"
									// The same as RETURN IIF(_suit,_suit,@"?")
									// This is the same as:
									//
									//	if (_suit != nil) {
									//		return _suit;
									//	} else {
									//		return @"?";
									//	}
}



+ (NSArray *)rankStrings
{
	return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];
}




+ (NSUInteger)maxRank
	{  return [self rankStrings].count-1;  }



// Setter for RANK, make sure they are not setting the rank beyond the bounds of the array.
-(void) setRank:(NSUInteger)vr_rank
{
	if (vr_rank <= [PC_PlayingCard maxRank])  // This is the format for calling a class method
		_rank = vr_rank;
}


// Returns a string of every card, every suit.  
-(NSString *)contents
{	
	NSArray *rankStrings = @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"J",@"Q",@"K"];  // The new format iOS 6 - does ALLOC INIT for you @[ ...
	NSString *card_contents = [rankStrings[self.rank] stringByAppendingString:self.suit];
	NSLog(@" %@",card_contents);
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
	//return card_contents;
}

@end