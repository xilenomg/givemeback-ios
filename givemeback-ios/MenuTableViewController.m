//
//  MenuTableViewController.m
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/9/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import "MenuTableViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface MenuTableViewController ()
    @property(nonatomic) int currentIndex;
@end

@implementation MenuTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
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
