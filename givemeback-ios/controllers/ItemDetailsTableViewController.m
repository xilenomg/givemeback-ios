//
//  ItemDetailsViewController.m
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import "ItemDetailsTableViewController.h"
#import "AppDelegate.h"

@interface ItemDetailsTableViewController ()

@end

@implementation ItemDetailsTableViewController

@synthesize item,contactEmail, contactPhone, contactName, expectedDeliveryDate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    if ( item != nil ){
        contactName.text = item.contact_name;
        contactEmail.text = item.contact_email;
        contactPhone.text = item.contact_phone;
        
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        expectedDeliveryDate.text = [dateFormatter stringFromDate:item.expected_delivery];
    }
    
    [self updateButtonLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions
-(IBAction)doSetDelivered:(id)sender{
    if ( item != nil ) {
        if ( item.delivered == nil ){
            [item setValue:[NSNumber numberWithInt:1] forKey:@"delivered"];
        }
        else{
            [item setValue:nil forKey:@"delivered"];
        }
        
        NSError *error;
        if (![self.managedObjectContext save:&error]) {
            NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
        }
        
        [self updateButtonLabel];
    }
}

#pragma mark - methods

-(void) updateButtonLabel{
    if ( item != nil ) {
        NSLog(@"Item delivered: %@", item.delivered);
        if ( item.delivered == nil ){
            [deliveredButton setTitle:@"Mark as delivered" forState:UIControlStateNormal];
        }
        else{
            [deliveredButton setTitle:@"Mark as NOT delivered" forState:UIControlStateNormal];
        }
    }
}

@end
