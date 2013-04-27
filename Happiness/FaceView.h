//
//  FaceView.h
//  Happiness
//
//  Created by ZackFang on 4/27/13.
//  Copyright (c) 2013 ZackFang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView; // forward reference, so compiler knows "the under" (FaceView *) of protocol

@protocol FaceViewDataSource // delegate

- (float)smileForFaceView:(FaceView *)sender; // FaceView declare later, from this point
                                              // compiler dosn't know FaceView Class.
@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

- (void)pinch:(UIPinchGestureRecognizer *)gesture; // make gesture public.

@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource;

@end
