//
//  ViewController.m
//  SingleV
//
//  Created by Matias Franco on 10/22/15.
//  Copyright © 2015 Matias Franco. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//private variables
@property (assign) float redColor;
@property (assign) float greenColor;
@property (assign) float blueColor;
@property (weak, nonatomic) IBOutlet UILabel *redLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeColor {
    //change color of backgorund
    self.view.backgroundColor = [self randomColor];
    //update labels
    self.redLabel.text = [NSString stringWithFormat:@"%@", @(self.redColor)];
    self.greenLabel.text = [NSString stringWithFormat:@"%@", @(self.greenColor)];
    self.blueLabel.text = [NSString stringWithFormat:@"%@", @(self.blueColor)];
    
}

- (UIColor *)randomColor {
    //return a random color
    self.redColor = (float)arc4random_uniform(255);
    self.greenColor = (float)arc4random_uniform(255);
    self.blueColor = (float)arc4random_uniform(255);
    UIColor * color = [UIColor colorWithRed:self.redColor/255.0 green: self.greenColor/255.0 blue: self.blueColor/255.0 alpha:1.0];
    return color;
}

-(NSString *) UIColorToHexString:(UIColor *)uiColor{
    CGFloat red,green,blue,alpha;
    [uiColor getRed:&red green:&green blue:&blue alpha:&alpha];
    
    NSString *hexString  = [NSString stringWithFormat:@"#%02x%02x%02x%02x",
                            ((int)alpha),((int)red),((int)green),((int)blue)];
    return hexString;
}

@end
