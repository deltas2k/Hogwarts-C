//
//  MOCharacter.m
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "MOCharacter.h"

static NSString * const kName = @"name";
static NSString * const kHouse = @"house";
static NSString * const kBloodStatus = @"bloodStatus";
static NSString * const kRole = @"role";
static NSString * const kDeathEater = @"deathEater";

@implementation MOCharacter

- (MOCharacter *)initWithName:(NSString *)name house:(NSString *)house role:(NSString *)role bloodStatus:(NSString *)bloodStatus deathEater:(BOOL)deathEater
{
    self = [super init];
    if (self)
    {
        _name = name;
        _house = house;
        _bloodStatus = bloodStatus;
        _role = role;
        _deathEater = deathEater;
    }
    return self;
}
@end

@implementation MOCharacter (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[kName];
    NSString *house = dictionary[kHouse];
    NSString *bloodStatus = dictionary[kBloodStatus];
    NSString *role = dictionary[kRole];
    BOOL deathEater = [dictionary[kDeathEater] boolValue];
    
    return [self initWithName:name house:house role:role bloodStatus:bloodStatus deathEater:deathEater];
}

@end
