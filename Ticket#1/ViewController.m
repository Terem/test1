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
        myImage.frame = CGRectMake(20, 43, 128, 128);
        lastName.frame = CGRectMake(180,76,100,21);
        firstName.frame = CGRectMake(180,116,100,21);
        surName.frame = CGRectMake(180,156,100,21);
        dateOfBirth.frame = CGRectMake(180,196,100,21);
        bio.frame = CGRectMake(57,244,249,120);
        contacts.frame = CGRectMake(57,380,223,21);
        NSLog(@"Portrait!!!!!!!!!!");
    } else {
        myImage.frame = CGRectMake(20, 43, 128, 128);
        lastName.frame = CGRectMake(160,24,100,21);
        firstName.frame = CGRectMake(260,24,100,21);
        surName.frame = CGRectMake(360,24,100,21);
        dateOfBirth.frame = CGRectMake(160,60,100,21);
        bio.frame = CGRectMake(160,120,300,80);
        contacts.frame = CGRectMake(160,230,200,21);
        NSLog(@"Landscape!!!!!!!!!!");
    }
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self positionViews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self positionViews];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"my_db.sqlite"];
    FMDatabase *database;
    database=[FMDatabase databaseWithPath:path];
    database.traceExecution=true;
    [database open];
    FMResultSet *results=[database executeQuery:@"select * from personal_data"];
    while ([results next]) {
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
    [self positionViews];
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
