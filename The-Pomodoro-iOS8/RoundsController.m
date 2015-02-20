//
//  RoundsController.m
//  The-Pomodoro-iOS8
//
//  Created by Taylor Mott on 18.2.2015.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RoundsController.h"
#import "Timer.h"

@interface RoundsController()

@property (strong, nonatomic) NSArray *roundTimes;

@end

@implementation RoundsController

+ (RoundsController *)sharedInstance {
    static RoundsController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RoundsController new];
    });
    
    return sharedInstance;
}

- (void)roundSelected
{
    [Timer sharedInstance].minutes = [[self roundTimes][self.currentRound] integerValue];
    [Timer sharedInstance].seconds = 0;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NewRoundNotification object:nil];
}

- (NSArray *)roundTimes
{
    return @[@25, @5, @25, @5, @25, @5, @25, @15];
}

+ (NSArray *)imageNames
{
    return @[@"work.png", @"play.png", @"work.png", @"play.png", @"work.png", @"play.png", @"work.png", @"nap.png"];
}

@end
