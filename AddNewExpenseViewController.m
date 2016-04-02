//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "AddNewExpenseViewController.h"

@interface AddNewExpenseViewController ()

{
    
    NSArray *_pickerData;//NSArray instance variable to store the list of data
    
    
}

@property (weak, nonatomic) IBOutlet UITextField *textCategory;
@property (weak, nonatomic) IBOutlet UITextField *textAmount;
@property (weak, nonatomic) IBOutlet UITextField *textDesc;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerCat;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *reclabel;

@property (weak, nonatomic) IBOutlet UISwitch *recswitch;


@end




@implementation AddNewExpenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Add New Expense";
    
     _pickerData = @[@"Select Category", @"Food", @"Travel", @"Mortgage", @"Transport", @"Car Insurance", @"Home Insurance", @"Groceries", @"Leisure", @"Children", @"Miscellaneous", @"Gas", @"Electricity", @"Phone", @"Water", @"Internet"];
    
    
    
    
    self.CatPicker.dataSource = self;
    
    self.CatPicker.delegate = self;
    }


- (IBAction)switchpressed:(id)sender {
    
    
    if(_recswitch.on){
        _reclabel.text = @"Recurring";
        
    }
    else {
        _reclabel.text = @"Non-Rec";
        
    }
    
    
}






-(void) passDataBack{
    OutgoingHolder* h = [[OutgoingHolder alloc ] init];
     NSString *catValue = [_pickerData objectAtIndex:[_pickerCat selectedRowInComponent:0]];
    
    h.category = catValue;
    h.category = self.textCategory.text;
    h.costdescription  = self.textDesc.text;
    h.date = self.datePicker.date;
    h.amount = [self.textAmount.text floatValue];
    h.recuringswitch = self.reclabel.text;
    [self.delegate passDataBack:h];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillDisappear:(BOOL)animated{
    //[self passDataBack];
}


// The number of columns of data

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView

{
    
    return 1;
    
}



// The number of rows of data

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component

{
    
    return _pickerData.count;
    
}



// The data to return for the row and component (column) that's being passed in

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component

{
    
    return _pickerData[row];
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    // Write your code here
    
    _textCategory.text = [_pickerData objectAtIndex:row];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    
    if ([identifier isEqualToString:@"saves"]) {
        
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
        
        if ([_textDesc.text  isEqual:@""])
        {
            _textDesc.layer.borderColor = [[UIColor redColor] CGColor];
            _textDesc.layer.borderWidth = 1.0;
            return NO;
        }
    }
    
    [self passDataBack];
    return YES;
}

@end
