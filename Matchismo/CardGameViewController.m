//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Fog City Solutions on 1/28/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardGameViewController.h"
#import "PC_PlayingCardDeck.h"
#import "PC_PlayingCard.h"
#import "PCCard.h"


// Private properties
@interface CardGameViewController ()
	@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
	@property (nonatomic) int flipCount;
	@property (nonatomic, strong) PCDeck *theDeck;
	@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end


@implementation CardGameViewController


// Getter
-(PCDeck *)theDeck
	{
		if (! _theDeck) _theDeck = [[PC_PlayingCardDeck alloc] init];
		return _theDeck;
	}

// Setter for cardButtons
-(void)setCardButtons:(NSArray *)ar_cardButtons
{
	_cardButtons = ar_cardButtons;
	for (UIButton *cardButton in self.cardButtons)
		{
		PCCard *card = [self.theDeck drawRandomCard];
		// [cardButton setTitle:card.contents forState:UIControlStateSelected];
		
		[cardButton setTitle:card.contents forState:UIControlStateSelected];
		}
	
}

- (IBAction)flipCard:(UIButton *)sender
	{
	if (sender.isSelected)
		{
		PCCard *selectedCard = [[PCCard alloc] init];	// one card that we select from the deck of cards
		selectedCard = [self.theDeck drawRandomCard];
		[sender setTitle:[NSString stringWithFormat:@" %@",selectedCard.contents] forState: UIControlStateSelected];		
		}
	
	sender.selected = !sender.isSelected;
	self.flipCount++;
	// self.flipCount = self.flipCount + 1;  Same as this - calls the setter and the getter 
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d ", self.flipCount];
	}




@end
