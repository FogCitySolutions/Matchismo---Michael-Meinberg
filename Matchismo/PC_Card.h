//
//  PC-Card.h
//  Stanford2013-Playing Cards
//
//  Created by Fog City Solutions on 1/26/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

// Information on One Card.  What is the card?  Can you see it?

#import <Foundation/Foundation.h>

@interface PC_Card : NSObject

	@property (nonatomic, strong) NSString *contents;
	@property (nonatomic, getter = isFaceUp) BOOL faceUp;
	@property (nonatomic, getter = isUnplayable) BOOL unplayable;

	-(int)match:(NSArray *)otherCards;

@end
