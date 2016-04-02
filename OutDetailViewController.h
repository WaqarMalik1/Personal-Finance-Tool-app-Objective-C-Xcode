//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface OutDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UITextField *catedit;
@property (weak, nonatomic) IBOutlet UITextField *amoedit;

@property (weak, nonatomic) IBOutlet UITextField *desedit;

@property (weak, nonatomic) IBOutlet UIDatePicker *dateedit;

@property (weak, nonatomic) IBOutlet UISwitch *editswitch;

@property (weak, nonatomic) IBOutlet UILabel *labeleditswitch;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end






