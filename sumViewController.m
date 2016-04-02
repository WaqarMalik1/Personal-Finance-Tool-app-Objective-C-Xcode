//  Created by Waqar Malik  on 06/05/2015.
//  Copyright (c) 2015 Waqar Malik . All rights reserved.


#import "sumViewController.h"

@interface sumViewController ()




@end

@implementation sumViewController


@synthesize totalincomingtotal;
@synthesize totaloutgoingtotal;


-(NSManagedObjectContext*)managedObjectContext{

    return [(AppDelegate*) [[UIApplication sharedApplication]delegate]managedObjectContext];
}


-(float)calculateIncome{
    
    float total=0.0;
    
    NSFetchRequest *fetchRequest =[[NSFetchRequest alloc]init];
    NSManagedObjectContext *context=[self managedObjectContext];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Ingoing" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor =[[NSSortDescriptor alloc]initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    fetchRequest.sortDescriptors=sortDescriptors;
    
    NSError *error;
    NSArray *items=[context executeFetchRequest:fetchRequest error:&error];
    
    for (id objects in items) {
        NSString *value=[objects valueForKey:@"amount"];
        
        total=total+value.doubleValue;
    }
    NSLog(@"total incoming %f",total);
    return total;
}

-(float)calculateOutcome{
    
    float total=0.0;
    
    NSFetchRequest *fetchRequest =[[NSFetchRequest alloc]init];
    NSManagedObjectContext *context=[self managedObjectContext];
    NSEntityDescription *entity=[NSEntityDescription entityForName:@"Outgoing" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor =[[NSSortDescriptor alloc]initWithKey:@"date" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    fetchRequest.sortDescriptors=sortDescriptors;
    
    NSError *error;
    NSArray *items=[context executeFetchRequest:fetchRequest error:&error];
    
    for (id objects in items) {
        NSString *value=[objects valueForKey:@"amount"];
        
        total=total+value.doubleValue;
    }
    NSLog(@"total outcome %f",total);
    return total;
}

-(void)viewDidAppear:(BOOL)animated{
    
    self.totout.text=[NSString stringWithFormat:@"%.2f", [self calculateOutcome]];
    
    self.totinc.text=[NSString stringWithFormat:@"%.2f", [self calculateIncome]];

    self.totbbal.text=[NSString stringWithFormat:@"%.2f", [self calculateIncome] -[self calculateOutcome]];

}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
