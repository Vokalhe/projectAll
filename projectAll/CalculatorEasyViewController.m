//
//  ViewController.m
//  projectAll
//
//  Created by Admin on 17.04.16.
//  Copyright © 2016 Ehlakov Victor. All rights reserved.
//

#import "CalculatorEasyViewController.h"

@interface CalculatorEasyViewController ()
//@property (nonatomic) double lastValue;
//@property (nonatomic) NSInteger lastTag;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLast;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFinal;
@property (strong, nonatomic) NSMutableString *numStringBig;
- (IBAction)cancel:(id)sender;
- (IBAction)actionWithNumbers:(id)sender;
- (IBAction)numbers:(id)sender;
- (IBAction)cancelAll:(id)sender;
- (IBAction)point:(id)sender;
@end

@implementation CalculatorEasyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)numbers:(id)sender {

    //self.numStringBig = [NSMutableString stringWithCapacity:10];
    NSMutableString *numStringOne = [NSMutableString stringWithFormat:@"%i", [sender tag]];
    self.numStringBig = self.textFieldFinal.text;
    
    self.numStringBig = [self.numStringBig stringByAppendingString:numStringOne];
    //[numString appendString:@""];
    self.textFieldFinal.text = self.numStringBig;
    lastValue = [self.numStringBig doubleValue];
   
}


- (IBAction)actionWithNumbers:(id)sender {//12 13 14 15 and = 11
    lastValue = [self.numStringBig doubleValue];
   // self.textFieldFinal.text = @"";

    //double currentValue = [self.textFieldFinal.text doubleValue];
    //self.textFieldFinal.text = @"";
    lastTag = [sender tag];
    double currentValue;
    if (lastTag == 12) {
        double currentValue = [self.textFieldFinal.text doubleValue];

        currentValue = lastValue + currentValue;

    }
   /* if (lastTag == 13) {
        currentValue = lastValue - currentValue;
    }
    if (lastTag == 14) {
        currentValue = lastValue * currentValue;
    }
    if (lastTag == 15 && currentValue != 0) {
        currentValue = lastValue / currentValue;
    }*/
//    if (lastTag == 11) {
//        self.textFieldFinal.text = [[NSNumber numberWithDouble:currentValue] stringValue];
//       
//    }
    lastValue = currentValue;
  
    self.textFieldFinal.text = [[NSNumber numberWithDouble:lastValue] stringValue];

   // self.textFieldLast.text = [[NSNumber numberWithDouble:lastValue] stringValue];
   
    
}
- (IBAction)cancel:(id)sender {
    
    NSMutableString  *str = [NSMutableString stringWithFormat:@"%@", self.numStringBig];
    if (self.numStringBig.length != 0) {
        [str deleteCharactersInRange:NSMakeRange([str length]-1, 1)];
        self.numStringBig = str;
        self.textFieldFinal.text = str;
    }
    
}
- (IBAction)cancelAll:(id)sender {
    
    self.textFieldFinal.text = @"";
    self.numStringBig = self.textFieldFinal.text;
    lastValue = 0;
    lastTag = 0;
}

- (IBAction)point:(id)sender {
    
    NSRange point = [self.textFieldFinal.text rangeOfString:@"."];
    if (point.location != NSNotFound) {
        return;
    }
   self.textFieldFinal.text = [self.textFieldFinal.text stringByAppendingString:@"."];
}
@end
