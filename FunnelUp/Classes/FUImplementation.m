//
//  FUImplementation.m
//  Pods
//
//  Created by Snyxius on 8/2/16.
//
//

#import "FUImplementation.h"

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
        // [[[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Something went wrong. Try again later." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        NSLog(@"Something went wrong");
    }

}

@end
