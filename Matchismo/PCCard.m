//
//  PCCard.m
//  Matchismo
//
//  Created by Fog City Solutions on 1/29/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PCCard.h"

@implementation PCCard


// Looking for a match of of this classes card in the otherCards array, if it is found, returns a 1, otherwise returns a 0
-(int)match:(NSArray *)otherCards
{
	int score = 0;
	for (PCCard *card in  otherCards)
		{
		score = 1;
		}
	return score;
}


@end
