//
//  ContainerViewController.m
//  FlashingFlag
//
//  Created by Streetwizard on 11/12/14.
//  Copyright (c) 2014 Wizart Interactive. All rights reserved.
//

#import "ContainerViewController.h"
#import "ViewController.h"

@interface ContainerViewController ()

@property (strong, nonatomic) ViewController *rVc;
@property (strong, nonatomic) ViewController *gVc;
@property (strong, nonatomic) ViewController *bVc;

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"EmbedRed"])
    {
        _rVc = (ViewController *)segue.destinationViewController;
        _rVc.rMult = 1.0;
    }
    
    if ([segue.identifier isEqualToString:@"EmbedGreen"])
    {
        _gVc = (ViewController *)segue.destinationViewController;
        _gVc.gMult = 1.0;
    }
    
    if ([segue.identifier isEqualToString:@"EmbedBlue"])
    {
        _bVc = (ViewController *)segue.destinationViewController;
        _bVc.bMult = 1.0;
    }
}

@end
