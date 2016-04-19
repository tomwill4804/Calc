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
    }
    return self;
}

-(NSString *) doCalc:(NSString *) operator {
    
    NSString *retValue;
    
    float operValue = [operator floatValue];
    switch (self.oper) {
            
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
            
    }
    
    retValue = [NSString stringWithFormat:@"%0.1f", self.total];
    
    return(retValue);
    
}


@end
