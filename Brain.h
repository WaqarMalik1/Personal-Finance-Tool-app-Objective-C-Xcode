//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import <Foundation/Foundation.h>

@interface Brain : NSObject

-(void)getOperand:(double)operand;
-(double)performCalculation:(NSString *)operation;
-(void)clearMemory;
@property (nonatomic, strong) NSMutableArray *operand;

@property (nonatomic, strong) NSMutableArray *totalcalculation;

-(NSString *) loopequation;


@end