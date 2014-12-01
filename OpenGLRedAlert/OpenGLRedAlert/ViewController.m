//
//  ViewController.m
//  OpenGLRedAlert
//
//  Created by Streetwizard on 11/12/14.
//  Copyright (c) 2014 Wizart Interactive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property float currentRed;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    GLKView *glView = (GLKView *)self.view;
    [glView setContext:[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2]];
    [EAGLContext setCurrentContext:[glView context]];
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(_currentRed, 0, 0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

- (void)update
{
    float secondsPerFlash = 2.0;
    _currentRed = (sinf(self.timeSinceFirstResume * 2 * M_PI / secondsPerFlash) * 0.5) + 0.5;
    
    //    NOTE:
    //    Well, sinf() is the sin function, which by default alternates between
    //    y = -1 and 1 for x = 0 -> M_PI.
    //    Here you are substituting time for x, so by default it will go between -1 and 1 every ~3.14 seconds.
    //
    //    You want it to flash more frequently than this.
    //    To do this, you want to modify the period of the sin function.
    //    You can do this by multiplying your x value by 2*M_PI/[desired period].
    //
    //    Similarly, you don’t want the values to go from -1 to 1, since negative colors don’t make any sense.
    //    You want it to go from 0 to 1 instead. To fix this, you multiply the result by 0.5 (so the range is now -0.5 to 0.5)
    //    and then add 0.5 (for a final 0 to 1).
}

@end
