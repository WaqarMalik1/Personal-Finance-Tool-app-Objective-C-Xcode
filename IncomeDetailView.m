//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "IncomeDetailView.h"

@interface IncomeDetailView ()


@property float _princ;


@end

@implementation IncomeDetailView

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        [self.dateditinc setDate:[self.detailItem valueForKey:@"date"]];
        self.amoeditinc.text = [[self.detailItem valueForKey:@"amount"] description];
        self.deseditinc.text = [[self.detailItem valueForKey:@"costdescription"] description];
        self.cateditinc.text = [[self.detailItem valueForKey:@"category"] description];
    
        self.labeleditswitchincome.text = [[self.detailItem valueForKey:@"ingoingrecuringswitch"] description];
        //NSLog(self.detailLabel.text);
        if ([self.labeleditswitchincome.text isEqualToString:@"Recurring"]) {
            [ _editswitchincome setOn:YES animated:YES];
        }
    }
}


- (IBAction)editincomeswitch:(id)sender {
    
    
    if(_editswitchincome.on){
        _labeleditswitchincome.text = @"Recurring";
        
    }
    else {
        _labeleditswitchincome.text = @"Non-recurring";
        
    }
    
    
}







        
        
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSManagedObjectContext*)managedObjectContext {
    NSManagedObjectContext* context = nil;
    id delegate = [[UIApplication sharedApplication]delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]){
        context = [delegate managedObjectContext];
    }
    return context;
}



-(void) viewWillDisappear:(BOOL)animated{
    NSManagedObjectContext* context = [self managedObjectContext];
    if([_amoeditinc hasText] && [_cateditinc hasText] && [_deseditinc hasText]){
        if (self.detailItem){
            
            __princ = [self.amoeditinc.text floatValue];
            [self.detailItem setValue:self.cateditinc.text forKey:@"category"];
            [self.detailItem setValue:[NSNumber numberWithFloat:__princ]forKey:@"amount"];
            [self.detailItem setValue:self.deseditinc.text forKey:@"costdescription"];
            [self.detailItem setValue:self.dateditinc.date forKey:@"date"];
            [self.detailItem setValue:self.labeleditswitchincome.text forKey:@"ingoingrecuringswitch"];
        }
        
        
    }
    
    NSError *error = nil;
    if (![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
}


@end

