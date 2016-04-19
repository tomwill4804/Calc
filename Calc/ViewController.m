//
//  ViewController.m
//  Calc
//
//  Created by Tom Williamson on 4/18/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController () {
    
    CalculatorBrain *brain;
    
    int maxDigits;
    int numDigits;
    NSString *number;
    
}

@end



@implementation ViewController

- (void) showNumber:(NSString*) num{
    
    self.display.text = [NSString stringWithFormat:@"%@", num];
    
}

- (void) resetNumber {
    
    numDigits = 0;
    number = @"0";
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    maxDigits = 9;
    total = 0.0;
    [self resetNumber];
    [self showNumber:number];
    
}


//
//  build the number we will use for the next operation
//  and change the display
//
- (IBAction)digit:(id)sender{
    
    //
    //  too many digits?
    //
    if (numDigits >= maxDigits)
        return;
    
    UIButton *btn = (UIButton *)sender;
    
    //
    //  see if current key is a period
    //  or we already have a period
    //
    bool period = ([btn.titleLabel.text isEqualToString:@"."]);
    NSRange range = [number rangeOfString:@"."];
    bool hasPeriod = (range.location != NSNotFound);
    
    if (period && hasPeriod)
        return;
    
    //
    //  add digit (character) to number
    //
    number = [number stringByAppendingString:btn.titleLabel.text];
    self.ac.titleLabel.text = @"C";
    
    
    //
    //  remove leading "0"
    //
    if ([number characterAtIndex:0] == '0' && !period && !hasPeriod)
        number = [number substringFromIndex:1];
    else
        if (!period)
            numDigits++;
    
    //
    //  reformat display
    //
    [self showNumber:number];

}



//
//  operator button
//
- (IBAction)oper:(id)sender{
    
    
}


//
//  clear button
//
- (IBAction)acPush:(id)sender{
    
    if ([self.ac.titleLabel.text isEqualToString:@"AC"])
        total = 0.0;
    
    self.ac.titleLabel.text = @"AC";
    [self resetNumber];
    [self showNumber:number];
    
    
}


//
//  plus/minus button
//
- (IBAction)pmPush:(id)sender{
    
    
}



//
//  percent button
//
- (IBAction)perPush:(id)sender{
    
    
}


@end
