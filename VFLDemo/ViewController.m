//
//  ViewController.m
//  VFLDemo
//
//  Created by 王若风 on 23/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "ViewController.h"
#import "RFView.h"

@interface ViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, assign) BOOL networkIndicatorWasVisible;

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UIBarButtonItem *forwardButton;
@property (nonatomic, strong) UIBarButtonItem *refreshButton;
@property (nonatomic, strong) UIBarButtonItem *shareButton;

@property (nonatomic, strong) RFView *view1;
@property (nonatomic, strong) RFView *view2;
@property (nonatomic, strong) RFView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self test1];
//    [self test2];
    [self test3];
    
    
}

/// 产生等高的2个View
- (void)test1 {
    
    UIView *view1 = [self randomBgColorView];
    UIView *view2 = [self randomBgColorView];
    
    [self.view addSubview:view1];
    [self.view addSubview:view2];
    
    NSDictionary *views = @{@"view1":view1,
                            @"view2":view2
                            };
    NSDictionary *metrics = @{@"margin":@20};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view1]-margin-|"
                                                                    options:0
                                                                    metrics:metrics
                                                                      views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view2]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-margin-[view1]-margin-[view2(==view1)]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    
}

/// 产生等高的3个View
- (void)test2 {
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.view1 = [self randomBgColorView];
    self.view2 = [self randomBgColorView];
    self.view3 = [self randomBgColorView];

    [self.view addSubview:self.view1];
    [self.view addSubview:self.view2];
    [self.view addSubview:self.view3];

    // 动态更新约束
    [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES block:^(NSTimer * _Nonnull timer) {
      NSLog(@"%s",__FUNCTION__);
        [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
            [self.view setNeedsUpdateConstraints];
        } completion:nil];
    }];
    
}

/// 产生一个webView和一个toolbar
- (void)test3 {
    self.view.translatesAutoresizingMaskIntoConstraints = NO;

    self.webView = [UIWebView new];
    self.webView.translatesAutoresizingMaskIntoConstraints = NO;
    self.webView.delegate = self;
    
    self.toolbar = [self setUpToolbar];

    [self.view addSubview:self.webView];
    [self.view addSubview:self.toolbar];
    
    NSDictionary *views = @{@"webView":self.webView,
                            @"toolbar":self.toolbar};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[webView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[toolbar]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[webView][toolbar(==44)]|" options:0 metrics:nil views:views]];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
}

#pragma mark - private

- (UIToolbar *)setUpToolbar {
    UIToolbar *toolbar = [UIToolbar new];
    toolbar.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapBackButton)];
    self.forwardButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"forward"] style:UIBarButtonItemStylePlain target:self action:@selector(didTapForwardButton)];
    self.refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(didTapRefreshButton)];
    self.shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(didTapShareButton)];
    
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *fixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    toolbar.items = @[fixed, self.backButton, flexible, self.forwardButton, flexible, self.refreshButton, flexible, self.shareButton, fixed];
    
    self.forwardButton.enabled = NO;
    self.backButton.enabled = NO;
    
    return toolbar;
}

- (void)didTapBackButton {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (void)didTapForwardButton {
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}

- (void)didTapRefreshButton {
    [self.webView reload];
}

- (void)didTapShareButton {
   UIActivityViewController *shareSheet = [[UIActivityViewController alloc] initWithActivityItems:@[self.webView.request.URL] applicationActivities:nil];
    
    [self presentViewController:shareSheet animated:YES completion:nil];
}


- (void)addVFLConstraints {
    
    NSArray *c1 = self.view.constraints;
    NSLog(@"%@",c1);
    
    [self.view removeConstraints:self.view.constraints];
    [self.view1 removeConstraints:self.view1.constraints];
    [self.view2 removeConstraints:self.view2.constraints];
    [self.view3 removeConstraints:self.view3.constraints];
    
    NSDictionary *views = @{@"view1":self.view1,
                            @"view2":self.view2,
                            @"view3":self.view3
                            };
    NSInteger margin = arc4random_uniform(88);
    NSLog(@"margin:%ld",margin);
    NSDictionary *metrics = @{@"margin":@(margin)};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view1]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view2]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-margin-[view3]-margin-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[view1]-30-[view2(==view1)]-30-[view3(==view1)]-40-|"
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    
//    [self addVFLConstraints];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (RFView *)randomBgColorView {
    RFView *view = [RFView new];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0
                                           green:arc4random_uniform(255)/255.0
                                            blue:arc4random_uniform(255)/255.0
                                           alpha:1];
    
    return view;
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    if (!self.networkIndicatorWasVisible) {
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
        self.networkIndicatorWasVisible = NO;
    }
    
    self.backButton.enabled = self.webView.canGoBack;
    self.forwardButton.enabled = self.webView.canGoForward;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    self.networkIndicatorWasVisible = UIApplication.sharedApplication.networkActivityIndicatorVisible;
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
}

@end
