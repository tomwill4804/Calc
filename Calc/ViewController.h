//
//  ViewController.h
//  Calc
//
//  Created by Tom Williamson on 4/18/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel  *display;
@property (nonatomic, strong) IBOutlet UIButton *ac;
@property (nonatomic, strong) IBOutlet UIButton *period;
@property (nonatomic, strong) IBOutlet UIButton *equal;
@property (nonatomic, strong) IBOutlet UIButton *divide;
@property (nonatomic, strong) IBOutlet UIButton *mult;
@property (nonatomic, strong) IBOutlet UIButton *add;
@property (nonatomic, strong) IBOutlet UIButton *sub;

- (IBAction)digit:(id)sender;
- (IBAction)oper:(id)sender;

- (IBAction)acPush:(id)sender;
- (IBAction)pmPush:(id)sender;
- (IBAction)perPush:(id)sender;


@end

