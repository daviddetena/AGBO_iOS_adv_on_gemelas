//
//  DTCImageViewController.m
//  gemelas
//
//  Created by David de Tena on 06/04/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import "DTCImageViewController.h"

@interface DTCImageViewController ()

@end

@implementation DTCImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadImage:(id)sender {
    NSURL *url = [NSURL URLWithString:@"http://media.vandal.net/master/14199/20121210152529_3.jpg"];
    NSData *imgData = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:imgData];
    self.photoView.image = image;
}
@end
