//
//  PC_PlayingCard_SET.h
//  Matchismo FCS HWK2
//
//  Created by Fog City Solutions on 2/18/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import "PC_PlayingCard.h"

@interface PC_PlayingCard_SET : PC_PlayingCard
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *color; // Unsigned integer, NOT an object, so no strong
@property (nonatomic, strong) NSString *shading;
@property (nonatomic) NSUInteger number;

+ (NSArray *)validSymbols;
+ (NSArray *)validSymbolColors;
+ (NSArray *)validSymbolShadings;
// + (NSUInteger)maxNumber;

@end
