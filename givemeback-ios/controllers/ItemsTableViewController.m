//
//  ItemsTableViewController.m
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/9/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import "ItemsTableViewController.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "AppDelegate.h"
#import "Items.h"
#import "ItemsTableViewCell.h"
#import "ItemDetailsTableViewController.h"

@interface ItemsTableViewController ()

@end

@implementation ItemsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLeftMenuButton];
    
    //Core Data
    AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    //loading data
    self.fetchedRecordsArray = [self getAllItems];
}

- (void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
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

#pragma retrieve data from core data

-(NSArray*) getAllItems {
    // initializing NSFetchRequest
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    //Setting Entity to be Queried
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Items" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    // Query on managedObjectContext With Generated fetchRequest
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    // Returning Fetched Records
    return fetchedRecords;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.fetchedRecordsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ItemCellIdentifier";
    ItemsTableViewCell *cell = (ItemsTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    Items * item = [self.fetchedRecordsArray objectAtIndex:indexPath.row];
    cell.itemNameLabel.text = [NSString stringWithFormat:@"%@",[item.name uppercaseString]];
    cell.itemContactNameLabel.text = [NSString stringWithFormat:@"Borrewed to: %@",item.contact_name];
    
    if ( [item.delivered isEqualToNumber:[NSNumber numberWithInt:1]]){
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    else if ([item.expected_delivery compare:[NSDate date]] == NSOrderedAscending) {
        [cell setBackgroundColor:[UIColor redColor]];
    }
    else{
        [cell setBackgroundColor: [UIColor whiteColor]];
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"SHOW_ITEM_DETAILS"]) {
        
        UITableViewCell *cell = (UITableViewCell*) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        ItemDetailsTableViewController *controller =  (ItemDetailsTableViewController *) segue.destinationViewController;
        
        controller.item = [self.fetchedRecordsArray objectAtIndex:[indexPath row]];
    }
}


@end
