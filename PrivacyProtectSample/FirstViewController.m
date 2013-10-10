//
//  FirstViewController.m
//  PrivacyProtectSample
//
//  Created by griffin_stewie on 2013/10/08.
//  Copyright (c) 2013年 cyan-stivy.net. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageView.hidden = YES;
    [self.indicator startAnimating];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"http://lorempixel.com/640/910/cats/"]
                                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                                 if (error) {
                                                                     NSLog(@"%s %@", __PRETTY_FUNCTION__, error);
                                                                     return ;
                                                                 }
                                                                 
                                                                 UIImage *image = [UIImage imageWithData:data];
                                                                 dispatch_async(dispatch_get_main_queue(), ^{
                                                                     [self.indicator stopAnimating];
                                                                     self.imageView.hidden = NO;
                                                                     self.imageView.image = image;
                                                                 });
                                                             }];
    [task resume];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
