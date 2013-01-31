//
//  PC-Card.m
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/26/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC_Card.h"

@interface PC_Card()

@end



@implementation PC_Card

	// Looking for a match of of this classes card in the otherCards array, if it is found, returns a 1, otherwise returns a 0
	-(int)match:(NSArray *)otherCards
		{
			int score = 0;
			for (PC_Card *card in  otherCards)
				{
				score = 1;
				}
			return score;
		}




@end
