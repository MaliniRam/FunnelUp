//
//  FUViewController.m
//  FunnelUp
//
//  Created by MaliniRam on 08/02/2016.
//  Copyright (c) 2016 MaliniRam. All rights reserved.
//

#import "FUViewController.h"
#import "FUImplementation.h"

@interface FUViewController ()

@end

@implementation FUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FUImplementation *obj=[[FUImplementation alloc]init];
    [obj myfirstFunction:@"Hare Krishna"];
  
    NSLocale *countryLocale = [NSLocale currentLocale];
    NSString *countryCode = [countryLocale objectForKey:NSLocaleCountryCode];
    NSString *country = [countryLocale displayNameForKey:NSLocaleCountryCode value:countryCode];
    NSLog(@"Country Code:%@ Name:%@", countryCode, country);
    NSString *langID = [[NSLocale preferredLanguages] objectAtIndex:0];
    NSString *lang = [[NSLocale currentLocale] displayNameForKey:NSLocaleLanguageCode value:langID];
    [obj registerForPushNotifications];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
