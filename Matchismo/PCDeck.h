//
//  PCDeck.h
//  Matchismo
//
//  Created by Fog City Solutions on 1/30/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import	"PCCard.h"


@interface PCDeck : NSObject
// Adds a card to the deck of cards Mutable array
-(void)	addCard:(PCCard *)card	atTop:(BOOL)atTop;
// grabs a random card from the array
-(PCCard *)drawRandomCard;
@end
