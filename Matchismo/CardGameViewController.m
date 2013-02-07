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
#import "CardMatchingGame.h"
#import "CardMatchingGame_3Card.h"


// Private properties
@interface CardGameViewController ()

	@property (weak, nonatomic) IBOutlet UILabel *whatHappened;
	@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
	@property (nonatomic) int flipCount;
	// @property (nonatomic, strong) Deck *theDeck;  Don't need this anymore, we are going to create it for a split second when we pull cards off it
	@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
	@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

	@property (strong, nonatomic) CardMatchingGame *cmGame; // Very common to have a pointer to your model.
																 //@property (strong, nonatomic) CardMatchingGame_3Card *cmGame3Card; // Very common to have a pointer to your model.

	//@property id cmGame;
	

	@property (weak, nonatomic) IBOutlet UISegmentedControl *cardGameType;
@end




@implementation CardGameViewController

-(CardMatchingGame *)cmGame
	{
		
		if (NOT _cmGame)
			_cmGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
													  usingDeck:[ [PC_PlayingCardDeck alloc] init] ];  // This creates the deck right here, and it will have no property value.
																												  // will be weak, but that is good here, as the deck only
																												  // needs to live long enough to set the cards.
		return _cmGame;
	}

//-(CardMatchingGame_3Card *)cmGame3Card
//{
//	//	if (NOT _game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
//	//															 usingDeck:self.theDeck];
//	
//	
//	if (NOT _cmGame3Card)
//		_cmGame3Card = [[CardMatchingGame_3Card alloc] initWithCardCount:[self.cardButtons count]
//													usingDeck:[ [PC_PlayingCardDeck alloc] init] ];  // This creates the deck right here, and it will have no property value.
//																									 // will be weak, but that is good here, as the deck only
//																									 // needs to live long enough to set the cards.
//	return _cmGame3Card;
//}


- (IBAction)twoOrThreeCards:(UISegmentedControl *)sender
	{
	
	
	if ([sender selectedSegmentIndex] == 0)
		{
		self.cmGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
															  usingDeck:[ [PC_PlayingCardDeck alloc] init] ];
		}
		else
		{
		self.cmGame = [[CardMatchingGame_3Card alloc] initWithCardCount:[self.cardButtons count]
												usingDeck:[ [PC_PlayingCardDeck alloc] init] ];
		} ;
		// Clears out all the UI stuff.
		self.whatHappened.text = @"";
		self.flipCount = 0;
		self.flipsLabel.text = @"Flips: 0";	
		[self updateUI];

	}



- (IBAction)dealCards:(UIButton *)sender
	{
		// Clears out all the UI stuff.
		self.whatHappened.text = @"";
		self.flipCount = 0;
		self.flipsLabel.text = @"Flips: 0";
		// self.scoreLabel.text = @"Score: 0";   // Undated in updateUI
		
		self.cmGame = nil;
		[self updateUI];
	}



-(void)viewDidLoad

{
	[super viewDidLoad];
	self.whatHappened.text = @"";
	self.cmGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
														usingDeck:[ [PC_PlayingCardDeck alloc] init] ];
}



-(void)updateUI
{
	for (UIButton *oneCardButton in self.cardButtons)
		{
		PCCard *card = [self.cmGame cardAtIndex:[self.cardButtons indexOfObject:oneCardButton]];
		
		// Back of the card as an image
        // UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];
		
		// Image stuff
		[oneCardButton setImage:card.imageOnCard forState:UIControlStateNormal];
		[oneCardButton setImage:[[UIImage alloc] init] forState:UIControlStateSelected]; // Sets it to a NIL image!
		[oneCardButton setImage:[[UIImage alloc] init] forState:UIControlStateSelected | UIControlStateDisabled]; // Sets it to a NIL image!
		oneCardButton.imageEdgeInsets = UIEdgeInsetsMake(4, 4, 4, 4);
		
		oneCardButton.selected = card.isFaceUp;
		
		[oneCardButton setTitle:card.contents forState:UIControlStateSelected];
        [oneCardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
		
		oneCardButton.enabled = NOT card.isUnplayable;
		[oneCardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled]; // The button is now disabled, so we need to set the title for that state too, or is shows the normal state
		
		oneCardButton.alpha	= (card.isUnplayable ? 0.5 : 1);  // dim it if it is marked unplayable.
		}
			
	
	CardMatchingGame_3Card *gameMe = self.cmGame;
	self.scoreLabel.text = [NSString stringWithFormat:@"Score %d ",self.cmGame.score];

	
	
	
	//		PCCard *cardA = [[PCCard alloc] init];
	//		PCCard *cardB = [self.cmGame cardAtIndex:1];
	//		PCCard *cardC = [self.cmGame cardAtIndex:0];
	//
	//		//NSLog(@" CardA: %@",cardA.contents);
	//		//NSLog(@" CardB: %@",cardB.contents);
	//		//NSLog(@" CardC: %@",cardC.contents);
	//		
	//		cardA.contents = @[cardB.contents,cardC.contents] [[cardB match:@[cardC]] ? 1 : 0 ];	 // our match program returns a number, not a BOOL however - so this probably does not work exactly right	
	// That is the same as this - (of course the index is determined by match
	// int index = 1;
	// cardA.contents = @[cardB.contents,cardC.contents] [index];
	//NSLog(@" CardA After: %@",cardA.contents);


}


// Setter for cardButtons
-(void)setCardButtons:(NSArray *)cardButtons
{
	_cardButtons = cardButtons;
	[self updateUI]; // this is really common - updates the view with information from the model.
}



-(void)setFlipCount:(int)flipCount
{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d ", self.flipCount];
}



- (IBAction)flipCard:(UIButton *)sender
	{
	self.flipCount++;
	self.whatHappened.text = [self.cmGame flipCardAtIndex:[self.cardButtons indexOfObject:sender] ];  // cardButtons is an array of the buttons on view (button collection), this gets the index of the sender button
	[self updateUI]; // this is really common - updates the view with information from the model.
	}


@end
