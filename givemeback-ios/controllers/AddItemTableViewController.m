//
//  AddItemViewController.m
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import "AddItemTableViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "AppDelegate.h"
#import "Items.h"

@interface AddItemTableViewController ()

@end

@implementation AddItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLeftMenuButton];
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
}

- (void)setupLeftMenuButton {
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton];
}

- (void)leftDrawerButtonPress:(id)leftDrawerButtonPress {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Button Actions

- (IBAction)doSave:(id)sender{
    NSLog(@"saving...");
    Items *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Items" inManagedObjectContext:self.managedObjectContext];
    
    newEntry.name = itemName.text;
    newEntry.contact_name = contactName.text;
    newEntry.contact_phone = contactPhone.text;
    newEntry.contact_email = contactEmail.text;
    newEntry.expected_delivery = expectedDeliveryDate.date;
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    itemName.text = @"";
    contactName.text = @"";
    contactPhone.text = @"";
    contactEmail.text = @"";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
