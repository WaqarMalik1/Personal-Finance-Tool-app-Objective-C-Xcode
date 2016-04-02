//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <UIKit/UIKit.h>
#import "IncomingHolder.h"




@protocol IncomeDataDelegate <NSObject>

@required
-(void) passDataBack:(IncomingHolder*)income;

@end

@interface AddNewIngoingViewController : UIViewController
@property (nonatomic, weak) id <IncomeDataDelegate> delegate;


@end