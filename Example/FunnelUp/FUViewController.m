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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
