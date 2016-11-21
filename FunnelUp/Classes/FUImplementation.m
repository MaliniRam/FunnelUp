//
//  FUImplementation.m
//  Pods
//
//  Created by Snyxius on 8/2/16.
//
//

#import "FUImplementation.h"
#import <UserNotifications/UserNotifications.h>
#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation FUImplementation
-(void)myfirstFunction:(NSString*)test
{
    NSLog(@"Hello World %@",test);
    
}
-(void)mySecondFunction:(NSString*)test
{
    NSLog(@"Hello World %@",test);
}
-(void)myThirdFunction:(NSString*)test
{
    NSLog(@"Hello World %@",test);
}

-(void)callwithappid:(NSString *)appId andDeviceToken:(NSString*)deviceToken
{
    NSLog(@"appId %@ and deviceToken %@",appId,deviceToken);
    
    @try
    {
        NSDictionary *sendDic=[NSDictionary dictionaryWithObjectsAndKeys:appId,@"appid",deviceToken,@"devicetoken", nil];
        NSError *writeError = nil;
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:sendDic options:NSJSONWritingPrettyPrinted error:&writeError];
        NSString *baseURL=@"http://45.55.245.79:81/projects/funnelup/branches/sumana/index.php/register/userdetails";
        NSURL *url = [NSURL URLWithString:baseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1660.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             
             if (connectionError)
             {
             
                 
             }
             else
             {
                 NSDictionary *jsonDic1=[[NSDictionary alloc]init];
                jsonDic1=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                 if (jsonDic1 == nil)
                 {
                     [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                 }
                 else
                 {
                     if ([[jsonDic1 valueForKey:@"status"]isEqualToString:@"success"])
                     {
                         NSLog(@"Details Saved");
                     }
                     else
                     {
                         NSLog(@"Something went wrong");
                     }
                     
                 }
             }
             
         }];
    }
    @catch (NSException *exception)
    {
       // [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
         NSLog(@"Something went wrong");
    }
}


-(void)saveUserDetailsWithAppId:(NSString*)appId withDeviceToken:(NSString*)deviceToken withUserName:(NSString*)userName andData:(NSDictionary*)dataDict
{
    NSLog(@"appId %@ and deviceToken %@ Data Dict",appId,deviceToken);
    @try
    {
        NSDictionary *sendDic=[NSDictionary dictionaryWithObjectsAndKeys:appId,@"appid",deviceToken,@"devicetoken",userName,@"userid",dataDict,@"data",nil];
        NSError *writeError = nil;
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:sendDic options:NSJSONWritingPrettyPrinted error:&writeError];
        NSString *baseURL=@"http://45.55.245.79:81/projects/gleantap/users/api/userdetails";
        NSURL *url = [NSURL URLWithString:baseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1660.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             
             if (connectionError)
             {
                 
                 
             }
             else
             {
                 NSDictionary *jsonDic1=[[NSDictionary alloc]init];
                 jsonDic1=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                 if (jsonDic1 == nil)
                 {
                     [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                 }
                 else
                 {
                     if ([[jsonDic1 valueForKey:@"status"]isEqualToString:@"success"])
                     {
                        
                         NSString *user_id=[NSString stringWithFormat:@"%@",[jsonDic1 valueForKey:@"user_id"]];
                         NSUserDefaults *prefs=[[NSUserDefaults alloc]init];
                         [prefs setObject:user_id forKey:@"gleanTapUserId"];
                         NSLog(@"Details Saved");
                     }
                     else
                     {
                         NSLog(@"Something went wrong");
                     }
                     
                 }
             }
             
         }];
    }
    @catch (NSException *exception)
    {
       // NSLog(@"Something went wrong");
    }

}
-(void)triggerEventWithUserId:(NSString*)userId andEventName:(NSString*)eventName
{
    @try
    {
        NSDictionary *sendDic=[NSDictionary dictionaryWithObjectsAndKeys:userId,@"user_id",eventName,@"event_name",nil];
        NSError *writeError = nil;
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:sendDic options:NSJSONWritingPrettyPrinted error:&writeError];
        NSString *baseURL=@"http://45.55.245.79:81/projects/gleantap/users/api/eventdetails";
        NSURL *url = [NSURL URLWithString:baseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1660.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             
             if (connectionError)
             {
                 
                 
             }
             else
             {
                 NSDictionary *jsonDic1=[[NSDictionary alloc]init];
                 jsonDic1=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                 if (jsonDic1 == nil)
                 {
                     [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                 }
                 else
                 {
                     if ([[jsonDic1 valueForKey:@"status"]isEqualToString:@"success"])
                     {
                         NSLog(@"Details Saved");
                     }
                     else
                     {
                        // NSLog(@"Something went wrong");
                     }
                     
                 }
             }
             
         }];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Something went wrong");
    }
}
-(void)identitfyUserWithAppId:(NSString*)appId andData:(NSDictionary*)dataDict
{
 
   @try
    {
        NSDictionary *sendDic=[NSDictionary dictionaryWithObjectsAndKeys:appId,@"appid",dataDict,@"data",nil];
        NSError *writeError = nil;
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:sendDic options:NSJSONWritingPrettyPrinted error:&writeError];
        NSString *baseURL=@"http://45.55.245.79:81/projects/gleantap/users/api/searchdetails";
        NSURL *url = [NSURL URLWithString:baseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1660.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             
             if (connectionError)
             {
                 
                 
             }
             else
             {
                 NSDictionary *jsonDic1=[[NSDictionary alloc]init];
                 jsonDic1=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                 if (jsonDic1 == nil)
                 {
                     [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                 }
                 else
                 {
                     if ([[jsonDic1 valueForKey:@"status"]isEqualToString:@"success"])
                     {
                         NSLog(@"Details Saved");
                     }
                     else
                     {
                         NSLog(@"Something went wrong");
                     }
                     
                 }
             }
             
         }];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Something went wrong");
    }

}


-(void)registerForPushNotifications
{
    if(SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(@"10.0")){
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if( !error ){
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        }];
    }
    
    else
    {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
        {
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
            
        }
        else
        {
            [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
             (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
        }
    }
}

-(void)callwithappid:(NSString *)appId andDeviceToken:(NSString*)deviceToken andData:(NSDictionary*)dataDict
{
     NSLog(@"appId %@ and deviceToken %@ Data Dict",appId,deviceToken);
    @try
    {
        NSDictionary *sendDic=[NSDictionary dictionaryWithObjectsAndKeys:appId,@"appid",deviceToken,@"devicetoken",dataDict,@"data",nil];
        NSError *writeError = nil;
        NSData *requestData = [NSJSONSerialization dataWithJSONObject:sendDic options:NSJSONWritingPrettyPrinted error:&writeError];
        NSString *baseURL=@"http://45.55.245.79:81/projects/funnelup/branches/sumana/index.php/register/userdetails";
        NSURL *url = [NSURL URLWithString:baseURL];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:1660.0];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
         {
             
             if (connectionError)
             {
                 
                 
             }
             else
             {
                 NSDictionary *jsonDic1=[[NSDictionary alloc]init];
                 jsonDic1=(NSDictionary*)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
                 if (jsonDic1 == nil)
                 {
                     [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
                 }
                 else
                 {
                     if ([[jsonDic1 valueForKey:@"status"]isEqualToString:@"success"])
                     {
                         NSLog(@"Details Saved");
                     }
                     else
                     {
                         NSLog(@"Something went wrong");
                     }
                     
                 }
             }
             
         }];
    }
    @catch (NSException *exception)
    {
        NSLog(@"Something went wrong");
    }

}

@end
