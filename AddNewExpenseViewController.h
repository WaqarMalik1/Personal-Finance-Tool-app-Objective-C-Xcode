//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import "OutgoingHolder.h"

@protocol ExpenseDataDelegate <NSObject>

@required
-(void) passDataBack:(OutgoingHolder*)expense;

@end

@interface AddNewExpenseViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, weak) id <ExpenseDataDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *CatPicker;


@end
