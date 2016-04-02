//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "Brain.h"

@interface Brain()
@end

@implementation Brain
@synthesize operand = _operand;
@synthesize totalcalculation = _totalcalculation;

- (NSMutableArray *)operand
{
    if (!_operand){
        _operand = [[NSMutableArray alloc] init];
    }
    return _operand;
}


- (NSMutableArray *)totalcalculation
{
    if (!_totalcalculation){
        _totalcalculation = [[NSMutableArray alloc] init];
    }
    return _totalcalculation;
}



-(void) clearMemory{
    
    [self.operand removeAllObjects];
}

-(void)getOperand:(double)operand
{
    
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operand addObject:operandObject];
    
}

-(double)setOperand
{
    NSNumber *operandEntry = [self.operand lastObject];
    if (operandEntry)
    {
        [self.operand removeLastObject];
    }
    return [operandEntry doubleValue];
}

-(double)performCalculation:(NSString *)operation
{
    
    //will return result of operation
    //setOperand is an array and it adds the number and removes it and adds the second opperand and removes it from array
    // divide, plus, minus is all same
    
    double result = 0;
    
    double int1 = [self setOperand]; //storing number in array
    double int2 = [self setOperand]; //storing number in array
    
    NSNumber *convertint1 = [NSNumber numberWithDouble: int1]; //converting int1 to a double
    NSNumber *convertint2 = [NSNumber numberWithDouble: int2]; //converting int1 to a double
    
    NSString *appending1 = [[convertint1 stringValue]stringByAppendingString:operation]; //appending putting number in string
    NSString *appending2 = [appending1 stringByAppendingString:[convertint2 stringValue]]; //appending putting number in string
    
    NSString *appending3 = [appending2 stringByAppendingString:@"="]; //this displays equal
    
    
    if ([operation isEqualToString:@"+"]){
        result = int1  + int2;
        
        NSNumber *totalresult = [NSNumber numberWithDouble:result];
        NSString *totalequation = [appending3 stringByAppendingString:[totalresult stringValue]];
        [self.totalcalculation addObject:totalequation];
        
    }
    
    else if ([operation isEqualToString:@"-"]){
        double subtrahend = int1;
        result = int2 - subtrahend;
        
        
        NSNumber *totalresult = [NSNumber numberWithDouble:result];
        NSString *totalequation = [appending3 stringByAppendingString:[totalresult stringValue]];
        [self.totalcalculation addObject:totalequation];
        
    }
    
    else if ([operation isEqualToString:@"*"]){
        result = int1  * int2;
        
        NSNumber *totalresult = [NSNumber numberWithDouble:result];
        NSString *totalequation = [appending3 stringByAppendingString:[totalresult stringValue]];
        
        [self.totalcalculation addObject:totalequation];
        
    }
    
    else if ([operation isEqualToString:@"/"]){
        double divisor = int1;
        result = int2  / divisor;
        
        NSNumber *totalresult = [NSNumber numberWithDouble:result];
        NSString *totalequation = [appending3 stringByAppendingString:[totalresult stringValue]];
        [self.totalcalculation addObject:totalequation];
        
        
        
    }else if ([operation isEqualToString:@"%"]){
        result = (int1) / 100.0;//built in function for power
        
        NSNumber *totalresult = [NSNumber numberWithDouble:result];
        NSString *totalequation = [appending3 stringByAppendingString:[totalresult stringValue]];
        
        [self.totalcalculation addObject:totalequation];
        
        
    }
    
    
    
    [self getOperand:result];
    return result;
    
    
}


-(NSString *) loopequation{ //looping through every calculation
    
    NSMutableString *totalequation = [[NSMutableString alloc]init];
    
    for (NSString *cacluone in _totalcalculation) {
        
        [totalequation appendFormat:@"\n%@",cacluone];
        
    }
    
    return totalequation;
    
}


@end

