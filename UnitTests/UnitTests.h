//
//  UnitTests.h
//  UnitTests
//
//  Created by Администратор on 4/2/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "ViewController.h"
#import "AppDelegate.h"

@interface UnitTests : SenTestCase

@property(nonatomic,readwrite,weak) ViewController *viewController;

@end
