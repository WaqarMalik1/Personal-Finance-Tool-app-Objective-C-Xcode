//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "AddNewIngoingViewController.h"


@interface AddNewIngoingViewController ()

@property (strong, nonatomic) IBOutlet UITextField *textCategory;

@property (strong, nonatomic) IBOutlet UITextField *textAmount;

@property (strong, nonatomic) IBOutlet UITextField *textDescription;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *recuringincomelabel;

@property (weak, nonatomic) IBOutlet UISwitch *recuringincomeswitch;


@end

@implementation AddNewIngoingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Add New Income";
}

-(void) passDataBack{
    IncomingHolder* h = [[IncomingHolder alloc ] init];
    h.category = self.textCategory.text;
    h.costdescription  = self.textDescription.text;
    h.date = self.datePicker.date;
    h.amount = [self.textAmount.text floatValue];
    h.recuringswitch = self.recuringincomelabel.text;

    
    [self.delegate passDataBack:h];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillDisappear:(BOOL)animated{
    //[self passDataBack];
}




- (IBAction)switchpressed2:(id)sender {
    
    
    if(_recuringincomeswitch.on){
        _recuringincomelabel.text = @"Recurring";
        
    }
    else {
        _recuringincomelabel.text = @"Non-Rec";
        
    }
    
    
}



- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"saves2"]) {
        
        if ([_textCategory.text  isEqual:@""])
        {
            //_textCategory.borderStyle = [UIColor redColor];
            
            _textCategory.layer.borderColor = [[UIColor redColor]CGColor];
            _textCategory.layer.borderWidth = 1.0;
            return NO;
            
        }
        
        if ([_textAmount.text  isEqual:@""])
        {
            _textAmount.layer.borderColor = [[UIColor redColor] CGColor];
            _textAmount.layer.borderWidth = 1.0;
            return NO;
        }
        
        if ([_textDescription.text  isEqual:@""])
        {
            _textDescription.layer.borderColor = [[UIColor redColor] CGColor];
            _textDescription.layer.borderWidth = 1.0;
            return NO;
        }
    }
    
    [self passDataBack];
    return YES;
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */







@end
