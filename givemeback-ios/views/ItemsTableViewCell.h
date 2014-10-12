//
//  ItemsTableViewCell.h
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *itemNameLabel;
@property(nonatomic, strong) IBOutlet UILabel *itemContactNameLabel;

@end
