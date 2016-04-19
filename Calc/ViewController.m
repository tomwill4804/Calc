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
    int numDigits;       // current number of digits on display
    NSString *operand;  // current number on display (0=start new number)
    
    bool reset;         // create new brain
    
}

@end



@implementation ViewController


- (void) showNumber:(NSString*) str{
    
    self.displayLabel.text = [NSString stringWithFormat:@"%@", str];
    
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
        brain = [[CalculatorBrain alloc] init];
    
    //
    //  new number started?
    //
    if (numDigits == 0) {
        operand = @"0";
        numDigits = 1;
    }
    
    //
    //  too many digits?
    //
    if (numDigits >= maxDigits)
        return;
    
    UIButton *btn = (UIButton *)sender;
    
    //
    //  see if current key is a period and we already have a period
    //
    if (sender == self.periodButton && [operand containsString:@"."])
        return;
    
    //
    //  add digit (character) to number
    //
    operand = [operand stringByAppendingString:btn.titleLabel.text];
    self.acButton.titleLabel.text = @"C";
    if (sender != self.periodButton || numDigits == 0)
        numDigits++;
    
    //
    //  remove leading "0"
    //
    if ([operand characterAtIndex:0] == '0' && ![operand containsString:@"."]) {
        numDigits--;
        operand = [operand substringFromIndex:1];
    }

    //
    //  reformat display
    //
    [self showNumber:operand];

}



//
//  operator button
//
- (IBAction)oper:(id)sender{
    
    //
    //  do calculation on last operand
    //
    reset = NO;
    if (numDigits > 0 || sender == self.equalButton)
        [self showNumber:[brain doCalc:operand]];

    //
    //  set operator (type of calculation) based on button tag
    //
    if (sender != self.equalButton) {
        UIButton *btn = (UIButton *)sender;
        brain.operator = (int)btn.tag;
    } else
        reset = YES;  // now that equal was done we need to reset
    
    //
    //  any new number entered now should start over
    //
    numDigits = 0;
    
}


//
//  clear button
//
- (IBAction)acPush:(id)sender{
    
    //
    //  if in "AC" mode init a new brain
    //
    if ([self.acButton.titleLabel.text isEqualToString:@"AC"])
        brain = [[CalculatorBrain alloc] init];
    
    //
    //  make sure text is set to "AC"
    //  clear number on display
    //
    self.acButton.titleLabel.text = @"AC";
    numDigits = 0;
    operand = @"0";
    [self showNumber:operand];
    
    
}


//
//  plus/minus button
//
- (IBAction)pmPush:(id)sender{
    
    
    //
    //  if starting new number then we have done an operation
    //  and we need to do this on the current brain
    //
    if (numDigits == 0) {
        brain.operator = operNeg;
        [self showNumber:[brain doCalc:nil]];
    }
    else {
        
        //
        //  do this on the display value
        //
        float operValue = [operand floatValue];
        operand = [NSString stringWithFormat:@"%g", operValue * -1];
        [self showNumber:operand];
    }
    
    
}



//
//  percent button
//
- (IBAction)perPush:(id)sender{
    
    //
    //  if starting new number then we have done an operation
    //  and we need to do this on the current brain
    //
    if (numDigits == 0) {
        brain.operator = operPercent;
        [self showNumber:[brain doCalc:nil]];
    }
    else {
        
        //
        //  do this on the display value
        //
        float operValue = [operand floatValue];
        operand = [NSString stringWithFormat:@"%g", operValue / 100];
        [self showNumber:operand];
        
    }

    
    
}


@end
