//
//  ChatClient.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "ChatClient.h"

@interface ChatClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation ChatClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 **/

- (void)fetchChatData:(void (^)(NSArray<Message *> *))completion withError:(void (^)(NSString *error))errorBlock {
    NSURL * url = [NSURL URLWithString:@"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"];

    [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:url] completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error == nil) {
            NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error ];
            NSMutableArray * messages = [[NSMutableArray alloc] init];
            NSArray * array = (NSArray *) [dictionary objectForKey:@"data"];
            for (NSDictionary * json in array) {
                Message * item = [[Message alloc] initWithDictionary:json];
                [messages addObject:item];
            }
            completion(messages);
            
        } else {
            errorBlock(error.localizedDescription);
        }
    }].resume;
}

@end
