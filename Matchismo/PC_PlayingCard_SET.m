//
//  PC_PlayingCard_SET.m
//  Matchismo FCS HWK2
//
//  Created by Fog City Solutions on 2/18/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

// Used to build the deck.

#import "PC_PlayingCard_SET.h"
#import "FogCity_Defines.h"

@implementation PC_PlayingCard_SET


+ (NSArray *)validSymbols
	{
		return @[@"☐",@"●",@"▲"];
	}



+ (NSArray *)validSymbolColors
	{
		return @[@"Red",@"Blue",@"Green"];
	}



+ (NSArray *)validSymbolShadings
	{
		return @[@"Solid",@"Open",@"Striped"];
	}


- (int) match:(NSArray *)otherCards
{
    int matchScore = 1;
    
    if ([otherCards count] != 2) return 0;
    
    NSArray *myThreeCards = @[self, [otherCards objectAtIndex:0], [otherCards objectAtIndex:1]];
    
    NSMutableSet *numbersSet = [[NSMutableSet alloc] init];
    NSMutableSet *symbolsSet = [[NSMutableSet alloc] init];
    NSMutableSet *shadingsSet = [[NSMutableSet alloc] init];
    NSMutableSet *colorsSet = [[NSMutableSet alloc] init];
    
    for (PC_PlayingCard_SET *card in myThreeCards)
		{
        [numbersSet addObject: [NSNumber numberWithInt:card.number]];
        [symbolsSet addObject:card.symbol];
        [shadingsSet addObject:card.shading];
        [colorsSet addObject:card.color];
		}
    
    if ([numbersSet count] == 2) matchScore = 0;
    if ([symbolsSet count] == 2) matchScore = 0;
    if ([shadingsSet count] == 2) matchScore = 0;
    if ([colorsSet count] == 2) matchScore = 0;
    
    return matchScore;
}




// Returns a string of every card, every suit.
-(NSString *)contents
	{
		// Build the attributed string to return
		NSString *cardString = @"";
		for (x=1; x <= self.number; x++) cardString = [cardString stringByAppendingString:self.symbol];

		
		UIColor *cardColor = [UIColor redColor];
		if (self.color == @"Blue") cardColor = [UIColor blueColor];
		if (self.color == @"Green") cardColor = [UIColor greenColor];

		NSMutableDictionary *cardAttributes = [[NSMutableDictionary alloc] init];
		[cardAttributes addEntriesFromDictionary: @{ NSForegroundColorAttributeName:cardColor,
																NSFontAttributeName:[UIFont systemFontOfSize:14] } ];
		
		
		if ([self.shading isEqualToString:@"Solid"])  [cardAttributes addEntriesFromDictionary: @{ @-5 :NSStrokeWidthAttributeName }];
	
		if ([self.shading isEqualToString:@"Striped"])
			[cardAttributes addEntriesFromDictionary: @{
						 NSStrokeWidthAttributeName : @-5,
						 NSStrokeColorAttributeName : cardAttributes[NSForegroundColorAttributeName],
					 NSForegroundColorAttributeName : [cardAttributes[NSForegroundColorAttributeName] colorWithAlphaComponent:0.1]
													  }
			 ];

		if ([self.shading isEqualToString:@"Open"]) [cardAttributes setObject:@5 forKey:NSStrokeWidthAttributeName]; // shadin- open
		NSMutableAttributedString *mat_cardvalue = [[NSMutableAttributedString alloc] initWithString:cardString attributes:cardAttributes];
		
		self.mat_Contents = mat_cardvalue;
		NSString *contents = [[[self.color plus:self.symbol]plus: self.shading] plus:[NSString stringWithFormat:@" %d",self.number]] ;
							 
		return contents;
	}






@end
