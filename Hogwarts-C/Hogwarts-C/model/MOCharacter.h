//
//  MOCharacter.h
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MOCharacter : NSObject

// name, house, bloodStatus, deathEater, role

@property(nonatomic,copy,readonly)NSString *name;
@property(nonatomic,copy,readonly,nullable)NSString *house;
@property(nonatomic,copy,readonly)NSString *role;
@property(nonatomic,copy,readonly)NSString *bloodStatus;
@property(nonatomic,readonly)BOOL deathEater;

- (MOCharacter *)initWithName:(NSString *)name
                        house:(NSString *)house
                         role:(NSString *)role
                  bloodStatus:(NSString *)bloodStatus
                   deathEater:(BOOL)deathEater;
@end

@interface MOCharacter (JSONConvertable)

- (instancetype) initWithDictionary: (NSDictionary<NSString *, id> *)dictionary;

@end
NS_ASSUME_NONNULL_END
