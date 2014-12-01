//
//  ViewController.h
//  FlashingFlag
//
//  Created by Streetwizard on 11/12/14.
//  Copyright (c) 2014 Wizart Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>
@import GLKit;

@interface ViewController : GLKViewController

@property (assign) float rMult;
@property (assign) float gMult;
@property (assign) float bMult;
@property (assign) float secondsPerFlash;

@end

