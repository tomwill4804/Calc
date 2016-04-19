//
//  CalculatorBrain.h
//  Calc
//
//  Created by Tom Williamson on 4/19/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <Foundation/Foundation.h>

enum CalcOperator {

    operNull = 0,
    operAdd,
    operSubtract,
    operMult,
    operDivide
    
};


@interface CalculatorBrain : NSObject

@property float total;
@property enum CalcOperator oper;


@end
