//
//  CardGame_SET_ViewController.m
//  Matchismo FCS HWK2
//
//  Created by Fog City Solutions on 2/18/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardGame_SET_ViewController.h"
#import "CardMatchingGame_3Card_Set.h"
#import "PC_PlayingCardDeck.h"


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
													usingDeck:[ [PC_PlayingCardDeck alloc] init] ];  // This creates the deck right here, and it will have no property value.
																									 // will be weak, but that is good here, as the deck only
																									 // needs to live long enough to set the cards.
	return _cmGame;
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
