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
    NSString *operand;
    
    bool reset;
    
}

@end



@implementation ViewController


- (void) showNumber:(NSString*) num{
    
    self.display.text = [NSString stringWithFormat:@"%@", num];
    
}

- (void) resetOperand {
    
    numDigits = 0;
    operand = @"0";
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    maxDigits = 9;
    reset = NO;
    [self acPush:nil];
    
}


//
//  build the number we will use for the next operation
//  and change the display
//
- (IBAction)digit:(id)sender{
    
    //
    //  new brain if "=" was used last time
    //
    if (reset == YES)
        brain = brain = [[CalculatorBrain alloc] init];
    
    //
    //  new number started
    //
    if (numDigits == 0)
        operand = @"0";
    
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
    if (sender == self.period && [operand containsString:@"."])
        return;
    
    //
    //  add digit (character) to number
    //
    operand = [operand stringByAppendingString:btn.titleLabel.text];
    self.ac.titleLabel.text = @"C";
    if (sender != self.period || numDigits == 0)
        numDigits++;
    
    //
    //  remove leading "0"
    //
    if ([operand characterAtIndex:0] == '0' && ![operand containsString:@"."])
        operand = [operand substringFromIndex:1];

    //
    //  reformat display
    //
    [self showNumber:operand];

}



//
//  operator button
//
- (IBAction)oper:(id)sender{
    
    reset = NO;
    if (numDigits > 0 || sender == self.equal) {
        self.display.text = [brain doCalc:operand];
    }

    
    if (sender != self.equal) {
        UIButton *btn = (UIButton *)sender;
        brain.oper = (int)btn.tag;
    } else
        reset = YES;
    
    numDigits = 0;
    
}


//
//  clear button
//
- (IBAction)acPush:(id)sender{
    
    if ([self.ac.titleLabel.text isEqualToString:@"AC"])
        brain = [[CalculatorBrain alloc] init];
    
    self.ac.titleLabel.text = @"AC";
    [self resetOperand];
    [self showNumber:operand];
    
    
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
