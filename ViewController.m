//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize Display = _Display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;
@synthesize operation = _operation;
@synthesize clearAllClearButtonText = _clearAllClearButtonText;
@synthesize signChange = _signChange;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //displays 0 on the label
    _Display.text = @"0";
    
}

//initialised brain

- (Brain *) brain

{
    
    if (!_brain) _brain = [[Brain alloc] init];
    return _brain;
    
}



- (IBAction)percentpressed:(id)sender {
    _operation = [sender currentTitle]; // getting the text of the button and putting it in the string
    
    [self.brain getOperand:[self.Display.text doubleValue]]; //gets number convers to double
    self.userIsInTheMiddleOfEnteringANumber = NO; //user not entering number
    
    
}



- (IBAction)digitPressed:(id)sender {
    
    //this is a string this is when a button clicked it stores in the string
    
    NSString *digit = [sender currentTitle];
    
    //swap text from AC to C for button
    
    [_clearAllClearButtonText setTitle:@"C" forState:UIControlStateNormal];
    
    if ([_Display.text isEqualToString:@"0"])
    {
        
        _Display.text = @"";
        if (digit == 0)
        {
            
            _Display.text = @"0";
        }
    }
    
    if (_userIsInTheMiddleOfEnteringANumber )
    {
        
        _Display.text = [_Display.text stringByAppendingString:
                         digit];
    }
    else
    {
        _Display.text = digit;
        _userIsInTheMiddleOfEnteringANumber = YES;
    }
}
- (IBAction)equalPressed {
    
    [self.brain getOperand:[self.Display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
    double result = [self.brain performCalculation:_operation];
    self.Display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)decimalPressed:(id)sender {
    
    NSRange range = [self.Display.text rangeOfString:@","];
    if (range.location == NSNotFound){
        self.Display.text = [ self.Display.text stringByAppendingString:@"."];
    }
    self.userIsInTheMiddleOfEnteringANumber = YES;
}

- (IBAction)ACPressed {
    
    //removes second number if u didnt want to do it
    
    [self.brain clearMemory];
    self.Display.text = @"0";
}

- (IBAction)CPressed {
    
    self.Display.text = @"0";
    
}

- (IBAction)operationPressed:(id)sender {
    _operation= [sender currentTitle];
    
    [self.brain getOperand:[self.Display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)negativePositivePressed:(id)sender {
    if ([_Display.text isEqualToString:@"0"]){
        return;
    }
    else{
        NSString *neg = @"-";
        if (!_signChange){
            _signChange = YES;
            _Display.text = [neg stringByAppendingFormat:_Display.text];
        }else {
            
            _signChange = NO;
            _Display.text = [self.Display.text substringFromIndex:1];
        }
    }
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"tapeviewportrait"]) {
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:[_brain loopequation] forKey:@"TapeNSdefaults"];
    }
}


-(void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration: (NSTimeInterval)duration {
    
    
    
    
    
    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
        
        
        
        [self performSegueWithIdentifier:@"landscape" sender:self];
        
        
        
    }else if (toInterfaceOrientation ==UIInterfaceOrientationLandscapeRight){
        
        
        
        [self performSegueWithIdentifier:@"landscape" sender:self];
        
    }
    
    
    
}


@end

