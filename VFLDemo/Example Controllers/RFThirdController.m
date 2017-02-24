//
//  RFThirdController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFThirdController.h"

@interface RFThirdController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, assign) BOOL networkIndicatorWasVisible;

@property (nonatomic, strong) UIBarButtonItem *backButton;
@property (nonatomic, strong) UIBarButtonItem *forwardButton;
@property (nonatomic, strong) UIBarButtonItem *refreshButton;
@property (nonatomic, strong) UIBarButtonItem *shareButton;

@end

@implementation RFThirdController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUp];
}

- (void)setUp {
    
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
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[webView][toolbar(==44)]|" options:0 metrics:nil views:views]];
    
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
