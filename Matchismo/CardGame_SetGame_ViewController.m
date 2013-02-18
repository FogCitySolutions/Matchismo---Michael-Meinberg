//
//  CardGame_SetGame_ViewController.m
//  Matchismo
//
//  Created by Fog City Solutions on 2/16/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "CardGame_SetGame_ViewController.h"
#import "CardMatchingGame_3Card_Set.h"
#import "GameResult.h"

@interface CardGame_SetGame_ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *whatHappened;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) CardMatchingGame_3Card_Set *cmGame;
@property (strong, nonatomic) GameResult *gameResult;

@property (nonatomic) int flipCount;

@end

@implementation CardGame_SetGame_ViewController



- (IBAction)dealCards:(UIButton *)sender
{
	// Clears out all the UI stuff.
	self.whatHappened.text = @"";
	self.flipCount = 0;
	self.flipsLabel.text = @"Flips: 0";
	// self.scoreLabel.text = @"Score: 0";   // Undated in updateUI
	
	self.cmGame = nil;
	self.gameResult = nil;
	[self updateUI];	
}



// Setter for cardButtons
-(void)setCardButtons:(NSArray *)cardButtons
{
	_cardButtons = cardButtons;
	[self updateUI]; // this is really common - updates the view with information from the model.
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
	
	
	// CardMatchingGame_3Card *gameMe = self.cmGame;
	self.scoreLabel.text = [NSString stringWithFormat:@"Score %d ",self.cmGame.score];
	
}

-(void)setFlipCount:(int)flipCount
{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d ", self.flipCount];
	self.gameResult.score = self.cmGame.score;
}





- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
