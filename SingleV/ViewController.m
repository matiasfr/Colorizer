//
//  ViewController.m
//  SingleV
//
//  Created by Matias Franco on 10/22/15.
//  Copyright © 2015 Matias Franco. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Lightness.h"
#import "CLRButton.h"
@import AudioToolbox;
@interface ViewController ()
//private variables
@property (assign) float redColor;
@property (assign) float greenColor;
@property (assign) float blueColor;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *helpLabel;
@property (weak, nonatomic) IBOutlet CLRButton *exportButton;
@property NSInteger hitCounter;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer* tapEngine = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchHandler:)];
    [self.view addGestureRecognizer:tapEngine];
    self.exportButton.buttonHighlightColor = self.view.backgroundColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchHandler: (UITapGestureRecognizer*) recognizer{
    [self changeColor];
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake )
    {
        [self changeColor];
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}

- (IBAction)exportColor:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.colorLabel.text;
}


-(void) changeColor {
    UIColor * color = [self randomColor];
    //update Label
    NSString * hexString = [[self hexStringFromColor:color]uppercaseString];
    self.colorLabel.text = hexString;
    //change color of backgorund
    if([color lightness] > 0.7) {
        self.colorLabel.textColor = [UIColor darkTextColor];
        self.exportButton.tintColor = [UIColor darkTextColor];
        [self.exportButton setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        self.helpLabel.textColor = [UIColor darkTextColor];
    } else {
        self.colorLabel.textColor = [UIColor whiteColor];
        self.exportButton.tintColor = [UIColor whiteColor];
        [self.exportButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.helpLabel.textColor = [UIColor whiteColor];
    }
    self.view.backgroundColor = color;
    [self setNeedsStatusBarAppearanceUpdate];
    if(self.hitCounter >=2 ) {
        [UIView animateWithDuration:0.75 animations:^{
            self.helpLabel.alpha = 0;
        }];
    }
    self.hitCounter++;
    self.exportButton.buttonHighlightColor = color;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if([self.view.backgroundColor lightness] > 0.7) {
        return UIStatusBarStyleDefault;
    } else {
        return UIStatusBarStyleLightContent;
    }
}

- (UIColor *)randomColor {
    //return a random color
    self.redColor = (float)arc4random_uniform(255);
    self.greenColor = (float)arc4random_uniform(255);
    self.blueColor = (float)arc4random_uniform(255);
    UIColor * color = [UIColor colorWithRed:self.redColor/255.0 green: self.greenColor/255.0 blue: self.blueColor/255.0 alpha:1.0];
    return color;
}

- (NSString *)hexStringFromColor:(UIColor *)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}

@end
