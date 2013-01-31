//
//  PC_PlayingCard.h
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/27/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//


// ************************************************************
// Subclass of Card.   Has all the properties of card, and more!

#import "PCCard.h"

@interface PC_PlayingCard : PCCard
	@property (nonatomic, strong) NSString *suit;
	@property (nonatomic) NSUInteger rank; // Unsigned integer, NOT an object, so no strong

	+ (NSArray *)validSuits;
	+ (NSUInteger)maxRank;
@end

