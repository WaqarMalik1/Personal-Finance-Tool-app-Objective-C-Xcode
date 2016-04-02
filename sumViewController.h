//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface sumViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *totout;
@property (weak, nonatomic) IBOutlet UILabel *totinc;
@property (weak, nonatomic) IBOutlet UILabel *totbbal;

@property (nonatomic) float totaloutgoingtotal;
@property (nonatomic) float totalincomingtotal;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
