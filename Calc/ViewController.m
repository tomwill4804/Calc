//
//  ViewController.m
//  Calc
//
//  Created by Tom Williamson on 4/18/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    float total;
    int maxDigits;
    int numDigits;
    int operation;
    NSString *number;
}

@end



@implementation ViewController

- (void) showNumber:(NSString*) num{
    
    self.display.text = [NSString stringWithFormat:@"%@", num];
    
}

- (void) resetNumber {
    
    numDigits = 1;
    number = @"0";
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    maxDigits = 9;
    [self resetNumber];
    [self showNumber:number];
    
}
- (IBAction)digit:(id)sender{
    
    if (numDigits < maxDigits) {
        UIButton *btn = (UIButton *)sender;
        
        
        bool period = ([btn.titleLabel.text isEqualToString:@"."]);
        NSRange range = [number rangeOfString:@"."];
        bool hasPeriod = (range.location != NSNotFound);
        
        if (period && hasPeriod)
            return;
        
        number = [number stringByAppendingString:btn.titleLabel.text];
        
        if ([number characterAtIndex:0] == '0' && !period && !hasPeriod)
            number = [number substringFromIndex:1];
        else
            if (!period)
                numDigits++;
  
        
        [self showNumber:number];
    }
}

@end
