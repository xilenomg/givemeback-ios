//
//  ItemsTableViewController.h
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/9/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsTableViewController : UITableViewController 

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSArray* fetchedRecordsArray;

-(NSArray*) getAllItems;

@end
