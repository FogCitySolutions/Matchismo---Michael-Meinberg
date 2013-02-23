//
//  CardGame_SET_ViewController.m
//  Matchismo FCS HWK2
//
//  Created by Fog City Solutions on 2/18/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardGame_SET_ViewController.h"
#import "CardMatchingGame_3Card_Set.h"
#import "PC_PlayingCardDeck_SET.h"


@interface CardGame_SET_ViewController ()
@property (strong, nonatomic) CardMatchingGame_3Card_Set *cmGame; //	This overrides the super class pointer to cmGame
															  //	Very common to have a pointer to your model.

@property (weak, nonatomic) IBOutlet UILabel *whatHappened;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
// @property (nonatomic, strong) Deck *theDeck;  Don't need this anymore, we are going to create it for a split second when we pull cards off it
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

@implementation CardGame_SET_ViewController


-(CardMatchingGame_3Card_Set *)cmGame
{
	
	if (NOT _cmGame)
		_cmGame = [[CardMatchingGame_3Card_Set alloc] initWithCardCount:[self.cardButtons count]
													usingDeck:[ [PC_PlayingCardDeck_SET alloc] init] ];  // This creates the deck right here, and it will have no property value.
																									 // will be weak, but that is good here, as the deck only
																									 // needs to live long enough to set the cards.
	return _cmGame;
}


- (IBAction)flipCardSET:(UIButton *)sender
{
	self.flipCount++;
	self.whatHappened.text = [self.cmGame flipCardAtIndex:[self.cardButtons indexOfObject:sender] ];  // cardButtons is an array of the buttons on view (button collection), this gets the index of the sender button
	[self updateUI]; // this is really common - updates the view with information from the model.
}



-(void)updateUI
	{
		for (UIButton *oneCardButton in self.cardButtons)
			{
			PCCard *card = [self.cmGame cardAtIndex:[self.cardButtons indexOfObject:oneCardButton]];
							
			oneCardButton.selected = card.isFaceUp;
			
			[card contents];
			[oneCardButton setAttributedTitle:card.mat_Contents forState:UIControlStateNormal];
			[oneCardButton setAttributedTitle:card.mat_Contents forState:UIControlStateSelected|UIControlStateDisabled];
			
			// oneCardButton.alpha	= (card.isFaceUp ? 0.9 : .3);
			oneCardButton.backgroundColor = (card.isFaceUp ? [UIColor colorWithHue: 1
																		saturation:.2
																		brightness:.7
																			 alpha:.7
															] :
															[UIColor colorWithHue:.5
																	   saturation:.9
																	   brightness:.1
																			alpha: 0
															 ] );
			
			
			
			oneCardButton.enabled = NOT card.isUnplayable;
			// [oneCardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled]; // The button is now disabled, so we need to set the title for that state too, or is shows the normal state
			
			oneCardButton.alpha	= (card.isUnplayable ? 0.1 : 1);  // dim it if it is marked unplayable.
			}
		// CardMatchingGame_3Card *gameMe = self.cmGame;
		self.scoreLabel.text = [NSString stringWithFormat:@"Score %d ",self.cmGame.score];	
	}



-(void)viewDidLoad
	{
		[super viewDidLoad];
		self.whatHappened.text = @"";
		self.cmGame = [[CardMatchingGame_3Card_Set alloc] initWithCardCount:[self.cardButtons count]
														usingDeck:[ [PC_PlayingCardDeck_SET alloc] init] ];
		[self updateUI];
	}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
	{
		self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
		if (self) {
			// Custom initialization
		}
		return self;
	}




@end
