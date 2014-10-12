//
//  MenuTableViewController.m
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/9/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import "MenuTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "AppDelegate.h"
#import "Items.h"

@interface MenuTableViewController ()
    @property(nonatomic) int currentIndex;
@end

@implementation MenuTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
    
    //Core Data
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    //loading data
    [self updateCountView];
}

-(void) viewWillAppear:(BOOL)animated{
    //loading data
    [self updateCountView];
}

- (void) updateCountView{
    self.fetchedRecordsArray = [self getAllItems];
    self.cellCount.text = [NSString stringWithFormat: @"%lu", (unsigned long)[self.fetchedRecordsArray count]];
}

#pragma mark - Core Data

-(NSArray*) getAllItems {
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    //filter
    NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"ANY delivered = nil"];
    [fetchRequest setPredicate:sPredicate];
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.currentIndex == indexPath.row) {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
        return;
    }
    
    UIViewController *centerViewController;
    switch (indexPath.row) {
        case 0:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ITEMS_TOP_VIEW_CONTROLLER"];
            break;
        case 1:
            centerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ADD_ITEM_TOP_VIEW_CONTROLLER"];
            break;
        default:
            break;
    }
    
    if (centerViewController) {
        self.currentIndex = indexPath.row;
        [self.mm_drawerController setCenterViewController:centerViewController withCloseAnimation:YES completion:nil];
    } else {
        [self.mm_drawerController closeDrawerAnimated:YES completion:nil];
    }
}


@end
