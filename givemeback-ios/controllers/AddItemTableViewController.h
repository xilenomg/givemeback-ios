//
//  AddItemViewController.h
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemTableViewController : UITableViewController{
    IBOutlet UITextField *itemName;
    IBOutlet UITextField *contactName;
    IBOutlet UITextField *contactPhone;
    IBOutlet UITextField *contactEmail;
    IBOutlet UIDatePicker *expectedDeliveryDate;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
-(IBAction) doSave:(id) sender;

@end
