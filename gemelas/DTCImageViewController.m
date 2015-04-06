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



#pragma mark - Init
- (id) init{
    if (self = [super initWithNibName:nil bundle:nil]) {
        //
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Blocks
-(void)imageWith:(void (^)(UIImage *image)) completionBlock{

    // Request a reusable queue and download image in background
    dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(download, ^{
        NSURL *url = [NSURL URLWithString:@"http://media.vandal.net/master/14199/20121210152529_3.jpg"];
        NSData *imgData = [NSData dataWithContentsOfURL:url];
        
        // Completion blocks will be executed in main queue
        dispatch_async(dispatch_get_main_queue(), ^{
            // Run completion block in main queue
            UIImage *image = [UIImage imageWithData:imgData];
            completionBlock(image);
        });
    });
    
    
}

#pragma mark - Actions
- (IBAction)downloadImage:(id)sender {
    // Call imageWith method with a completion block as a parameter
    [self imageWith:^(UIImage *image) {
        self.photoView.image = image;
    }];
}
@end
