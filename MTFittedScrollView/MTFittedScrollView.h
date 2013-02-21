//
//  MTFittedScrollView.h
//  FamilySearch
//
//  Created by Adam Kirk on 11/27/12.
//  Copyright (c) 2012 Family Search. All rights reserved.
//

@interface MTFittedScrollView : UIScrollView <UIScrollViewDelegate>


/**
 The zoomable view that is required for zooming in a scrollview. All your contain must be subviews of this.
 */
@property (readonly) UIView *zoomableContentView;

/**
 Figures out the best content size, content offset, etc so that all the content is 'fitted' within the scrollview
 */
- (void)fit;

/**
 Removes all the subviews.
 */
- (void)dump;

/**
 Adds a subview to the zoomable subview of the scrollview.
 */
- (void)addZoomableSubview:(UIView *)view;


@end
