//
//  UnitTests.m
//  UnitTests
//
//  Created by Администратор on 4/2/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "UnitTests.h"



@implementation UnitTests
@synthesize viewController=_viewController;

- (void)setUp
{
    [super setUp];
   
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testOutlets
{
    //STComposeString(@"Unit tests are not implemented yet in UnitTests");
    //NSLog(@"FirstName!?????!!!!!!!!!! : %@",self.viewController.firstName.text);
    STAssertNil(self.viewController.firstName.text, @"firstName.text is void");
    [self.viewController viewDidLoad];
     self.viewController.firstName.text=@"Tqwertt";
    
    //NSLog(@"FirstName!!!!!!!!!!! : %@",self.viewController);
    STAssertNotNil(self.viewController.firstName.text, @"firstName.text is void %@",self.viewController.firstName.text);

}

@end
