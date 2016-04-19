//
//  ViewController.h
//  Calc
//
//  Created by Tom Williamson on 4/18/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel  *displayLabel;
@property (nonatomic, strong) IBOutlet UIButton *acButton;
@property (nonatomic, strong) IBOutlet UIButton *periodButton;
@property (nonatomic, strong) IBOutlet UIButton *equalButton;


- (IBAction)digit:(id)sender;
- (IBAction)operator:(id)sender;

- (IBAction)acPush:(id)sender;
- (IBAction)pmPush:(id)sender;
- (IBAction)perPush:(id)sender;


@end

