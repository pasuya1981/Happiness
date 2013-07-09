//
//  FaceView.h
//  Happiness
//
//  Created by ZackFang on 4/27/13.
//  Copyright (c) 2013 ZackFang. All rights reserved.
//

#import <UIKit/UIKit.h>

// forward reference
// so compiler knows "the under" (FaceView *) of protocol
@class FaceView; 

@protocol FaceViewDataSource // delegate

// FaceView declare later, from this point
// compiler cant read (FaceView *)
// so need to add "@class FaceView;" on top
// for compiler to read "(FaceView *)sender;"
- (float)smileForFaceView:(FaceView *)sender;

@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;

// make gesture public.
- (void)pinch:(UIPinchGestureRecognizer *)gesture; 

// FaceView class only know the method, notice "id"
@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource; 

@end
