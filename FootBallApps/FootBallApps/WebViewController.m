//
//  WebViewController.m
//  FootBallApps
//
//  Created by Angus on 13-7-10.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithURLString:(NSString*)urlString
{
    self = [super init];
    if(self){
        self.urlString = urlString;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.webView];
    
    NSURLRequest* request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
