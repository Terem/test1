//
//  UnitTests.m
//  UnitTests
//
//  Created by Администратор on 4/2/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "UnitTests.h"



@implementation UnitTests


- (void)setUp
{
    [super setUp];
   
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testOutlets
{
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ViewController *viewController=[storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    STAssertNotNil([viewController view],nil);
    NSLog(@"@@@@@@@@@@@@@@ : %@",viewController.firstName.text);
    STAssertNotNil(viewController.firstName.text, @"First name is void!!!");
    STAssertNotNil(viewController.lastName.text, @"Last name is void!!!");
    STAssertNotNil(viewController.surName.text, @"Sur name is void!!!");
    STAssertNotNil(viewController.dateOfBirth.text, @"Date of birth is void!!!");
    STAssertNotNil(viewController.bio.text, @"Biografy is void!!!");
    STAssertNotNil(viewController.contacts.text, @"Contacts is void!!!");
    STAssertNotNil(viewController.myImage.image, @"Image is empty!!!");
    
    STAssertEqualObjects(viewController.firstName.text, @"Andrey", @"First name is nor equal : Andrey");
      
}



@end
