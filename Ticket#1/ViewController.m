//
//  ViewController.m
//  Ticket#1
//
//  Created by Администратор on 3/25/13.
//  Copyright (c) 2013 Администратор. All rights reserved.
//

#import "ViewController.h"
#import "fmdb/src/FMDatabase.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lastName,firstName,surName,dateOfBirth,bio,contacts,myImage;


-(void) positionViews {
    UIInterfaceOrientation destOrientation = self.interfaceOrientation;
    if (destOrientation == UIInterfaceOrientationPortrait ||
        destOrientation == UIInterfaceOrientationPortraitUpsideDown) {
        //—-if rotating to portrait mode—-
        myImage.frame = CGRectMake(20, 43, 128, 128);
        lastName.frame = CGRectMake(180,76,100,21);
        firstName.frame = CGRectMake(180,116,100,21);
        surName.frame = CGRectMake(180,156,100,21);
        dateOfBirth.frame = CGRectMake(180,196,100,21);
        bio.frame = CGRectMake(57,244,249,120);
        contacts.frame = CGRectMake(0,0,223,21);
        [self.view setNeedsDisplay];
    } else {
        NSLog(@"Landscape!!!!!!!!!!");
        //—-if rotating to landscape mode—-
        myImage.frame = CGRectMake(20, 43, 128, 128);
        lastName.frame = CGRectMake(195,64,100,21);
        firstName.frame = CGRectMake(306,64,100,21);
        surName.frame = CGRectMake(413,64,100,21);
        dateOfBirth.frame = CGRectMake(195,117,100,21);
        bio.frame = CGRectMake(284,216,171,120);
        contacts.frame = CGRectMake(188,241,100,21);
        [self.view setNeedsDisplay];
    }
}

/*- (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:
(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration {
    [self positionViews];
}*/


- (void)viewDidLoad
{
    [self positionViews];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"my_db.sqlite"];
    FMDatabase *database;
    database=[FMDatabase databaseWithPath:path];
    database.traceExecution=true;
    [database open];
    FMResultSet *results=[database executeQuery:@"select * from personal_data"];
    while ([results next]) {
        //NSString *lastN=[results stringForColumn:@"lastname"];
        //[self setLastName:[NSString stringWithFormat:@"%@",lastN]];
        lastName.text=[results stringForColumn:@"lastname"];
        firstName.text=[results stringForColumn:@"firstname"];
        surName.text=[results stringForColumn:@"surname"];
        dateOfBirth.text=[results stringForColumn:@"dateofbirth"];
        bio.text=[results stringForColumn:@"bio"];
        contacts.text=[results stringForColumn:@"contacts"];
        NSData *imageData=[results dataForColumn:@"foto"];
        NSLog(@"FOTO : %@",imageData);
        myImage.image=[UIImage imageWithData:imageData];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
    //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    //return (interfaceOrientation == UIInterfaceOrientationPortrait ||
    //        interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    //return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
