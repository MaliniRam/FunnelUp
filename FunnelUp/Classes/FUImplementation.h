//
//  FUImplementation.h
//  Pods
//
//  Created by Snyxius on 8/2/16.
//
//

#import <Foundation/Foundation.h>

@interface FUImplementation : NSObject
-(void)myfirstFunction:(NSString*)test;
-(void)mySecondFunction:(NSString*)test;
-(void)myThirdFunction:(NSString*)test;
-(void)callwithappid:(NSString *)appId andDeviceToken:(NSString*)deviceToken;
-(void)callwithappid:(NSString *)appId andDeviceToken:(NSString*)deviceToken andData:(NSDictionary*)dataDict;
-(void)saveUserDetailsWithAppId:(NSString*)appId withDeviceToken:(NSString*)deviceToken withUserName:(NSString*)userId andData:(NSDictionary*)dataDict;
-(void)triggerEventWithUserId:(NSString*)userId andEventName:(NSString*)eventName;
-(void)identitfyUserWithAppId:(NSString*)appId andData:(NSDictionary*)dataDict;
@end
