//
//  MTFittedScrollView.m
//  FamilySearch
//
//  Created by Adam Kirk on 11/27/12.
//  Copyright (c) 2012 Family Search. All rights reserved.
//

#import "MTFittedScrollView.h"

@interface MTFittedScrollView ()
@property (weak, nonatomic) id<UIScrollViewDelegate> proxyDelegate;
@end



@implementation MTFittedScrollView

@synthesize zoomableContentView = _zoomableContentView;

- (void)setup
{
    super.delegate = self;
    _zoomableContentView = [[UIView alloc] initWithFrame:CGRectZero];
    self.autoresizesSubviews = NO;
    _zoomableContentView.autoresizesSubviews = NO;
    [self addSubview:_zoomableContentView];
}

- (id)init
{
    self = [super init];
    if (self) [self setup];
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) [self setup];
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) [self setup];
    return self;
}

- (void)setDelegate:(id<UIScrollViewDelegate>)delegate
{
    _proxyDelegate = delegate;
}

- (void)addZoomableSubview:(UIView *)view
{
    [_zoomableContentView addSubview:view];
}

- (void)fit
{
    // find the boundaries
    CGFloat minX = INFINITY;
    CGFloat minY = INFINITY;
    CGFloat maxX = 0;
    CGFloat maxY = 0;
    for (UIView *sv in _zoomableContentView.subviews) {
        CGPoint topLeft                 = sv.frame.origin;
        CGPoint bottomright             = CGPointMake(sv.frame.origin.x + sv.frame.size.width, sv.frame.origin.y + sv.frame.size.height);
        if (topLeft.x < minX) minX      = topLeft.x;
        if (topLeft.y < minY) minY      = topLeft.y;
        if (bottomright.x > maxX) maxX  = bottomright.x;
        if (bottomright.y > maxY) maxY  = bottomright.y;
    }

    if (minX == INFINITY) minX = 0;
    if (minY == INFINITY) minY = 0;

    // The delta we must move all the content and the offset
    CGPoint offsetDelta = CGPointMake(minX, minY);

    // move all the content by the delta
    for (UIView *sv in _zoomableContentView.subviews) {
        CGRect frame    = sv.frame;
        frame.origin.x  -= offsetDelta.x;
        frame.origin.y  -= offsetDelta.y;
        sv.frame = frame;
    }

    // move the content offset by the delta
    CGPoint offset      = self.contentOffset;
    offset.x            -= offsetDelta.x * self.zoomScale;
    offset.y            -= offsetDelta.y * self.zoomScale;
    self.contentOffset  = offset;

    // expand the zoomable view to contain all the subviews
    CGRect frame                = _zoomableContentView.frame;
    frame.size.width            = maxX - minX;
    frame.size.height           = maxY - minY;
    frame.size.width            *= self.zoomScale;
    frame.size.height           *= self.zoomScale;
    _zoomableContentView.frame  = frame;

    // update the content size of the scrollview
    
    self.contentSize = frame.size;
}

- (void)dump
{
    for (UIView *sv in _zoomableContentView.subviews) {
        [sv removeFromSuperview];
    }
}



#pragma mark - scroll view delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        [_proxyDelegate viewForZoomingInScrollView:scrollView];
    }
    return _zoomableContentView;
}



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidEndDecelerating:)])
        [_proxyDelegate scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidEndDragging:willDecelerate:)])
        [_proxyDelegate scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidEndScrollingAnimation:)])
        [_proxyDelegate scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidEndZooming:withView:atScale:)])
        [_proxyDelegate scrollViewDidEndZooming:scrollView withView:view atScale:scale];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidScroll:)])
        [_proxyDelegate scrollViewDidScroll:scrollView];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidScrollToTop:)])
        [_proxyDelegate scrollViewDidScrollToTop:scrollView];
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewDidZoom:)])
        [_proxyDelegate scrollViewDidZoom:scrollView];
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewShouldScrollToTop:)])
        return [_proxyDelegate scrollViewShouldScrollToTop:scrollView];
    return YES;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewWillBeginDecelerating:)])
        [_proxyDelegate scrollViewWillBeginDecelerating:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewWillBeginDragging:)])
        [_proxyDelegate scrollViewWillBeginDragging:scrollView];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewWillBeginZooming:withView:)])
        [_proxyDelegate scrollViewWillBeginZooming:scrollView withView:view];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if ([_proxyDelegate respondsToSelector:@selector(scrollViewWillEndDragging:withVelocity:targetContentOffset:)])
        [_proxyDelegate scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}


@end
