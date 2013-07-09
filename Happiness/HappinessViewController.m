//
//  HappinessViewController.m
//  Happiness
//
//  Created by ZackFang on 4/27/13.
//  Copyright (c) 2013 ZackFang. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

// delegate FaceView protocol, must do implementation
@interface HappinessViewController () <FaceViewDataSource> 

@property (nonatomic, weak) IBOutlet FaceView *faceView;

@end

@implementation HappinessViewController
@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (void)setHappiness:(int)happiness
{
    _happiness = happiness;
    [self.faceView setNeedsDisplay];
}

// system will set the FaceView
- (void)setFaceView:(FaceView *)faceView
{
    _faceView = faceView;
    // overRide faceView setter, connecting "Pinch" gesture defined in FaceView Object
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    // let controller conform to FaceView protocol
    self.faceView.dataSource = self; 
}

- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2; // devide by 2 make it less sensitive, minus "-", cause y goes donw when accumulated.
        [gesture setTranslation:CGPointZero inView:self.faceView];
    }
}

// implementate the protocol method (must do)
// notice, int happiness 0 to 100; in other case, float smile -1 to 1; 
- (float)smileForFaceView:(FaceView *)sender
{
    return (self.happiness -50) / 50.0; // 50.0 is gonna make integer promote to float
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

@end
