//
//  ItemDetailsViewController.h
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Items.h"

@interface ItemDetailsTableViewController : UITableViewController{
    Items * item;
    
    IBOutlet UILabel *contactName;
    IBOutlet UILabel *contactPhone;
    IBOutlet UILabel *contactEmail;
    IBOutlet UILabel *expectedDeliveryDate;
    
    IBOutlet UIButton *deliveredButton;
}

@property (nonatomic, retain) IBOutlet UILabel *contactName;
@property (nonatomic, retain) IBOutlet UILabel *contactPhone;
@property (nonatomic, retain) IBOutlet UILabel *contactEmail;
@property (nonatomic, retain) IBOutlet UILabel *expectedDeliveryDate;
@property (nonatomic, retain) Items *item;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

-(IBAction) doSetDelivered:(id)sender;

@end
