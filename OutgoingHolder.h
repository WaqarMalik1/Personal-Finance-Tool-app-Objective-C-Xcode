//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <Foundation/Foundation.h>

@interface OutgoingHolder : NSObject

@property (nonatomic) float amount;
@property (nonatomic, strong) NSString * category;
@property (nonatomic, strong) NSString * costdescription;
@property (nonatomic, strong) NSDate * date;
@property (nonatomic, retain) NSString * recuringswitch;

@end
