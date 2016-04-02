//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AddNewExpenseViewController.h"

@interface OutgoingMasterViewController : UITableViewController
<NSFetchedResultsControllerDelegate, ExpenseDataDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic)float summarytotaloutgoing;


@end

