//
//  CalculatorBrain.m
//  Calc
//
//  Created by Tom Williamson on 4/19/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain


-(void) doCalc:(NSString *) operator {
    
    
    float operValue = [operator floatValue];
    switch (self.oper) {
            
        case operNull:
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
            
            
    }
    
}


@end
