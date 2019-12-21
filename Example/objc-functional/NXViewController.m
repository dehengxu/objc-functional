//
//  NXViewController.m
//  objc-functional
//
//  Created by dehengxu on 12/21/2019.
//  Copyright (c) 2019 dehengxu. All rights reserved.
//

#import "NXViewController.h"
#import <ObjC+Functional.h>

@interface NXViewController ()

@end

@implementation NXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSArray *countries = @[@"China", @"UN", @"England", @"Swizz", @"Korea", @"Russia"];
    NSArray *asia = @[@"China", @"Korea", @"Japan", @"Russia"];
    NSDictionary<NSString*, NSNumber*> *citizenAmount = @{@"China":@333444, @"Korea":@3423, @"Japan":@33, @"Russia":@44492};

    NSArray* val1 = [countries nx_map:^id _Nonnull(NSString* _Nonnull value) {
        return @(value.length);
    }];
    NSLog(@"val1: %@", val1);


    NSArray* val2 = [countries nx_filter:^BOOL(NSString* _Nonnull value) {
        return [asia containsObject:value];
    }];
    NSLog(@"filter: %@", val2);

    id val3 = [countries nx_reduce:^id _Nonnull(NSNumber*  _Nonnull previousResult, NSString*  _Nonnull current, NSUInteger currentIndex) {
        return @(MAX(previousResult.integerValue, citizenAmount[current].integerValue));
    }];
    NSLog(@"reduce, citizen ammount max: %@", val3);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
