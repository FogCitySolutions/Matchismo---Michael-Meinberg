//
//  PCCard.h
//  Matchismo
//
//  Created by Fog City Solutions on 1/29/13.
//  Copyright (c) 2013 Fog City Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PCCard : NSObject
{
	int x;
	NSString * test;
}


@property (nonatomic, strong) NSString *contents;
@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;
@property (nonatomic, strong) UIImage *imageOnCard;

-(int)match:(NSArray *)otherCards;


@end
