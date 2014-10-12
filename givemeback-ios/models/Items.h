//
//  Items.h
//  givemeback-ios
//
//  Created by Luis Felipe Perez on 10/10/14.
//  Copyright (c) 2014 Dataminas Tecnologia e Sistemas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Items : NSManagedObject

@property (nonatomic, retain) NSString * contact_email;
@property (nonatomic, retain) NSString * contact_name;
@property (nonatomic, retain) NSString * contact_phone;
@property (nonatomic, retain) NSDate * created_at;
@property (nonatomic, retain) NSDate * expected_delivery;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * delivered;

@end
