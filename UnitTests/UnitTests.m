//
//  UnitTests.m
//  UnitTests
//
//  Created by Администратор on 4/2/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "UnitTests.h"
#import "ViewController.h"

@implementation UnitTests

- (void)setUp
{
    [super setUp];
    //controller=[[ViewController alloc]init];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testOutlets
{
    //STComposeString(@"Unit tests are not implemented yet in UnitTests");
   // STAssertEqualObjects(@"Tereshkin", [(UILabel*)[controller viewWithTag:1]text], @"Owner is ni Tereshkin")
    
    STAssertEqualObjects(@"Tereshkin",
                         [[controller viewWithTag:1]text], @"Owner is no Tereshkin");
}

@end
