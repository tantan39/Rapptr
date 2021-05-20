//
//  LoginClient.m
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

#import "LoginClient.h"

@interface LoginClient ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation LoginClient

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 **/

- (void)loginWithEmail:(NSString *)email password:(NSString *)password completion:(void (^)(NSDictionary *, NSString *) )completion
{
    NSURL * url = [NSURL URLWithString:@"http://dev.rapptrlabs.com/Tests/scripts/login.php"];
    
//    NSDictionary * params = @{ @"email": email,
//                               @"password": password
//    };
    
    NSString *params = [NSString stringWithFormat:@"email=%@&password=%@",email, password];
    NSData *data = [params dataUsingEncoding:NSUTF8StringEncoding];

//    NSData *dataFromDict = [NSJSONSerialization dataWithJSONObject:params
//                                                           options:NSJSONWritingPrettyPrinted
//                                                             error:nil];

    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = data;
    
    [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSDictionary * dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error ];

        if (httpResponse.statusCode == 200) {
            completion(dictionary, nil);
        } else {
            NSString * msg = [dictionary valueForKey:@"message"];
            completion(dictionary, msg);
        }
    }].resume;
}

@end
