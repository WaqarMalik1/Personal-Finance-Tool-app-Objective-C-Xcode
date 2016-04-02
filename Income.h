//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Income : NSManagedObject

@property (nonatomic, retain) NSNumber * amount;
@property (nonatomic, retain) NSString * costdescription;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSString * category;

@property (nonatomic, retain) NSString * ingoingrecuringswitch;


@end
