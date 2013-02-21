//
//  MTViewController.m
//  MTFittedScrollView
//
//  Created by Adam Kirk on 2/20/13.
//  Copyright (c) 2013 Mysterious Trousers. All rights reserved.
//

#import "MTViewController.h"
#import "MTFittedScrollView.h"



@interface MTViewController ()
@property (weak, nonatomic) IBOutlet MTFittedScrollView *fittedScrollView;
@end




@implementation MTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_fittedScrollView fit];
}

- (IBAction)addViewButtonTapped:(id)sender {
    CGFloat x = (arc4random() % 2000) + 50;
    CGFloat y = (arc4random() % 2000) + 50;
    CGFloat w = (arc4random() % 200) + 50;
    CGFloat h = (arc4random() % 200) + 50;
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    v.backgroundColor = [UIColor redColor];
    [_fittedScrollView addZoomableSubview:v];
    [_fittedScrollView fit];
}



@end
