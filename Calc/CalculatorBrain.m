//
//  CalculatorBrain.m
//  Calc
//
//  Created by Tom Williamson on 4/19/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain


- (instancetype)init
{
    self = [super init];
    if (self) {
        _total = 0.0;
        _operator = operNull;
    }
    return self;
}

-(NSString *) doCalc:(NSString *) operand {
    
    NSString *retValue;
    
    //
    //  convert operator to float and do the operation
    //
    float operValue;
    if (operand)
        operValue = [operand floatValue];
    
    switch (self.operator) {
            
        case operNull:
            self.total = operValue;
            break;
            
        case operAdd:
            self.total += operValue;
            break;
            
        case operSubtract:
            self.total -= operValue;
            break;
            
        case operMult:
            self.total *= operValue;
            break;
            
        case operDivide:
            self.total /= operValue;
            break;
            
        case operPercent:
            self.total /= 100.;
            break;

        case operNeg:
            self.total *= -1.;
            break;

            
    }
    
    //
    //  return string from float or int depending on type
    //
    if (self.total == (int)self.total)
        retValue = [NSString stringWithFormat:@"%d", (int)self.total];
    else
        retValue = [NSString stringWithFormat:@"%g", self.total];
    
    return(retValue);
    
}


@end
