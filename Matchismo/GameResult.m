//
//  GameResult.m
//  Matchismo
//
//  Created by Fog City Solutions on 2/10/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "GameResult.h"

// Private declartions
@interface GameResult()
	@property (nonatomic, readwrite) NSDate *start; // Private: This class can read and write it.
	@property (nonatomic, readwrite) NSDate *end; // Private: This class can read and write it.
@end


@implementation GameResult
#define ALL_RESULTS_KEY @"GameResults_all"
#define START_KEY @"StartDate"
#define END_KEY	@"EndDate"
#define SCORE_KEY @"Score"



+(NSArray *) allGameResults
{
	NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
	
	for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues])
		{
		GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
		[allGameResults addObject:result];
		}
	
	return allGameResults;
}



// convenience initializer, this calls the desinator init routine - hence the [self init]
-(id)initFromPropertyList: (id)plist
{
	self = [self init];
	if (self)
		{
		if ([plist isKindOfClass:[NSDictionary class]])
			{
			NSDictionary *resultDictionary = (NSDictionary *)plist;  // could be NSDictionary *resultDictonary - plist;
			_start = resultDictionary[START_KEY];
			_end = resultDictionary[END_KEY];
			_score = [resultDictionary[SCORE_KEY] intValue];
			if (! _start || ! _end ) self = nil;
			}
		}
	return self;
}




-(void)synchronize
	{
		NSMutableDictionary *mutableGameResultsFromUserDefaults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
		if (! mutableGameResultsFromUserDefaults ) mutableGameResultsFromUserDefaults = [[NSMutableDictionary alloc] init];
		mutableGameResultsFromUserDefaults[[self.start description]] = [self asPropertyList];  // The first bracket is "key for dictionary", the second runs the self.start description method.
		[[NSUserDefaults standardUserDefaults] setObject:mutableGameResultsFromUserDefaults forKey:ALL_RESULTS_KEY];
		[[NSUserDefaults standardUserDefaults] synchronize];
	}




// Don't need to worry about the order anymore - yeah!  Put this method anywhere in the class
// NOTE:  He made this return "id", I left it as a dictionary
// This is generating a NSDictionary as a property list.  INT would not work in a property list, which is why we need to change it into NSNumber.
-(NSDictionary *)asPropertyList
	{
		return @{ START_KEY : self.start,END_KEY: self.end, SCORE_KEY : @(self.score) };  // @(self.score)  turns the "int" into an NSNumber
	}



-(id)init
	{
		self = [super init];
		if (self)
			{
			_start = [NSDate date];  // only other place besides the setter and getters it is proper, and in fact preferred, to use the iVar
			_end = _start;
			}
		return self;
	}



-(NSTimeInterval)duration
{
	return [self.end timeIntervalSinceDate:self.start]; // duration = StartDate - EndDate
}

-(void) setScore:(int)score
{
	_score = score;
	self.end = [NSDate date];
	[self synchronize];
}

@end
