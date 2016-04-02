//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface IncomeDetailView : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UITextField *cateditinc;
@property (weak, nonatomic) IBOutlet UITextField *amoeditinc;
@property (weak, nonatomic) IBOutlet UITextField *deseditinc;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateditinc;

@property (weak, nonatomic) IBOutlet UISwitch *editswitchincome;

@property (weak, nonatomic) IBOutlet UILabel *labeleditswitchincome;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
