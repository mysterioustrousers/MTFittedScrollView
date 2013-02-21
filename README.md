MTFittedScrollView
==================

A UIScrollView subclass that resizes itself to fit around its content.

## Installation

In your Podfile, add this line:

    pod "MTFittedScrollView"

pod? => https://github.com/CocoaPods/CocoaPods/


## Usage

Add a scrollview:

![Add a scrollview](https://dl.dropbox.com/u/2771219/github/MTFittedScrollView/1.png "Add a scrollview")

Assign it the class of `MTFittedScrollView`:

![Add a scrollview](https://dl.dropbox.com/u/2771219/github/MTFittedScrollView/2.png "Add a scrollview")

Set up your min and max zoom and such:

![Add a scrollview](https://dl.dropbox.com/u/2771219/github/MTFittedScrollView/3.png "Add a scrollview")

Set your content insets to something reasonable (so your content isn't right up against the scrolling edges)

![Add a scrollview](https://dl.dropbox.com/u/2771219/github/MTFittedScrollView/4.png "Add a scrollview")

Add some content to your fitted scrollview:

    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    v.backgroundColor = [UIColor redColor];
    [_fittedScrollView addZoomableSubview:v];

Add some more content, but at an offset of 1000 (so its way outside the current scrollable area):

    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(x + 1000, y + 1000, w, h)];
    v.backgroundColor = [UIColor redColor];
    [_fittedScrollView addZoomableSubview:v];

Call `fit` on the scrollview:

    [_fittedScrollView fit];

And magically, the scrollview fits around it's content so you an scroll and zoom all of it.

Make sure you clone this repo and try out the demo app so you can see how it works.

## Notes

Autolayout has some pretty nasty bugs with scrollviews. If you're trying to do fancy stuff with scrollviews & auto layout, have fun. ...Then file a bug with Apple.

## Author

[Adam Kirk](https://github.com/atomkirk) ([@atomkirk](https://twitter.com/atomkirk))
