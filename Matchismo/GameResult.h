//
//  GameResult.h
//  Matchismo
//
//  Created by Fog City Solutions on 2/10/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject
	@property (nonatomic, readonly) NSDate *start; // Public API: Others can only ready this variable.
	@property (nonatomic, readonly) NSDate *end; // Public API: Others can only ready this variable.
	@property (nonatomic, readonly) NSTimeInterval duration;
	@property (nonatomic) int score;

	+(NSArray *) allGameResults;

@end

