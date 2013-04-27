//
//  HappinessViewController.m
//  Happiness
//
//  Created by ZackFang on 4/27/13.
//  Copyright (c) 2013 ZackFang. All rights reserved.
//

#import "HappinessViewController.h"
#import "FaceView.h"

@interface HappinessViewController () <FaceViewDataSource> // delegate the protocol, must do the implementation

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
    self.faceView.dataSource = self; // set the FaceView delegator to be the controler
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
