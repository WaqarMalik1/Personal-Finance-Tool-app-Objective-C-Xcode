//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.

#import "OutDetailViewController.h"

@interface OutDetailViewController ()

@property float _pri;


@end

@implementation OutDetailViewController

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
        [self.dateedit setDate:[self.detailItem valueForKey:@"date"]];
        self.amoedit.text = [[self.detailItem valueForKey:@"amount"] description];
        self.desedit.text = [[self.detailItem valueForKey:@"costdescription"] description];
        self.catedit.text = [[self.detailItem valueForKey:@"category"] description];
        self.labeleditswitch.text = [[self.detailItem valueForKey:@"recuringswitch"] description];
//NSLog(self.detailLabel.text);
if ([self.labeleditswitch.text isEqualToString:@"Recurring"]) {
[ _editswitch setOn:YES animated:YES];
}
    }
}


- (IBAction)editswitchbutton:(id)sender {
    
    if(_editswitch.on){
        _labeleditswitch.text = @"Recurring";
        
    }
    else {
        _labeleditswitch.text = @"Non-Rec";
        
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
    if([_amoedit hasText] && [_catedit hasText] && [_desedit hasText]){
        if (self.detailItem){
            
            __pri = [self.amoedit.text floatValue];
            [self.detailItem setValue:self.catedit.text forKey:@"category"];
            [self.detailItem setValue:[NSNumber numberWithFloat:__pri]forKey:@"amount"];
            [self.detailItem setValue:self.desedit.text forKey:@"costdescription"];
            [self.detailItem setValue:self.dateedit.date forKey:@"date"];
            [self.detailItem setValue:self.labeleditswitch.text forKey:@"recuringswitch"];
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
