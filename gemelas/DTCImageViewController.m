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

    // Create a queue
    dispatch_queue_t queue = dispatch_queue_create("GOW", 0);
    
    // Send our custom queue a block to be executed in background.
    // Blocks get a constant copy of the environment so objects can not be modified unless we define
    // them with __block outside the block
    __block UIImage *image = nil;
    __block NSData *imgData = nil;

    dispatch_async(queue, ^{
        // Download
        NSURL *url = [NSURL URLWithString:@"http://media.vandal.net/master/14199/20121210152529_3.jpg"];
        imgData = [NSData dataWithContentsOfURL:url];
        
        // We need UIKit code to be run in foreground but right after getting imgData,
        // so we execute this code in the main queue within a block
        // Jump from our queue to the main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            image = [UIImage imageWithData:imgData];
            self.photoView.image = image;

        });
    });
}
@end
