//
//  GameResultsViewController.m
//  Matchismo
//
//  Created by Fog City Solutions on 2/8/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameResult.h"


@interface GameResultsViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textDisplay;

@end

@implementation GameResultsViewController



-(void)updateUI
{
	NSString *displayText = @"";
	for (GameResult *result in [GameResult allGameResults])
		{
		displayText = [displayText stringByAppendingFormat:@"Score %d (%@, %0g \n)",result.score,result.end,round(result.duration) ]; // %0g is unformated floating number 
		
		}
	self.textDisplay.text = displayText;
}



-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
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
