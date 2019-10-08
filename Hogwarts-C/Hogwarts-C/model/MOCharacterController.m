//
//  MOCharacterController.m
//  Hogwarts-C
//
//  Created by Matthew O'Connor on 10/8/19.
//  Copyright © 2019 Karl Pfister. All rights reserved.
//

#import "MOCharacterController.h"

static NSString * const kBaseURLString = @"https://www.potterapi.com/v1/";
static NSString * const kCharacterString = @"characters";
static NSString * const kAPIKeyKey = @"key";
static NSString * const kAPIKeyValue = @"$2a$10$y5AUNTfth.tX6U.c/qNMuOWHmc0C2jIyomi89gaI8peFbeaDPn8..";


@implementation MOCharacterController
+ (instancetype)sharedInstance
{
    static MOCharacterController *shardInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shardInstance = [[MOCharacterController alloc] init];
    });
    return shardInstance;
}

+ (void)fetchCharacters:(void (^)(NSArray<MOCharacter *> * _nullable))completion
{
    //step 1: build url
    NSURL *baseURL = [NSURL URLWithString:kBaseURLString];
    NSURL *characterURL = [baseURL URLByAppendingPathComponent:kCharacterString];
    NSURLQueryItem *apiKey = [[NSURLQueryItem alloc] initWithName:kAPIKeyKey value:kAPIKeyValue];
    NSURLComponents *components = [NSURLComponents componentsWithURL:characterURL resolvingAgainstBaseURL:true];
    components.queryItems = @[apiKey];
    NSURL *finalURL = components.URL;
    
    
    //step 2: start dataTask
    [[[NSURLSession sharedSession]dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
      {
        //check the error
        if (error)
        {
            NSLog(@"%@",error.localizedDescription);
            completion(nil);
            return;
        }
        //handle response
        if (response)
        {
            NSLog(@"%@", response);
        }
        //handle data
        if (data)
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (!topLevelDictionary)
            {
                NSLog(@"error parsing data %@", error);
                completion(nil);
                return;
            }
            ///create landing zone for characters
            NSMutableArray *characterArray = [NSMutableArray new];
            /// loop thru TLD and init each dictionary
            for (NSDictionary *characterDictionary in topLevelDictionary)
            {
                MOCharacter *character = [[MOCharacter alloc] initWithDictionary:characterDictionary];
                [characterArray addObject:character];
            }
            ///complete with that array of character
            completion(characterArray);
        }
    }]resume];
    
    
    
}
@end
