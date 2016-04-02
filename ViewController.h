//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.


#import <UIKit/UIKit.h>
#import "Brain.h"

@interface ViewController : UIViewController

//these are button actions

@property (strong, nonatomic) IBOutlet UILabel *Display;
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) Brain *brain;
@property (nonatomic, weak) NSString *operation;
@property (nonatomic) BOOL signChange;
@property (strong, nonatomic) IBOutlet UIButton * clearAllClearButtonText;



@end

