//
//  MTFittedScrollView.h
//  FamilySearch
//
//  Created by Adam Kirk on 11/27/12.
//  Copyright (c) 2012 Family Search. All rights reserved.
//

@interface MTFittedScrollView : UIScrollView <UIScrollViewDelegate>

@property (readonly) UIView *zoomableContentView;

- (void)fit;
- (void)dump;
- (void)addZoomableSubview:(UIView *)view;

@end
