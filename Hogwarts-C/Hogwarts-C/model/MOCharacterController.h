//
//  MOCharacterController.h
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MOCharacter.h"

NS_ASSUME_NONNULL_BEGIN

@interface MOCharacterController : NSObject

+ (instancetype)sharedInstance; //declaration for shared instance
+ (void)fetchCharacters:(void(^)(NSArray<MOCharacter *>*character))completion;

@end

NS_ASSUME_NONNULL_END
