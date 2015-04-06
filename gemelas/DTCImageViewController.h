//
//  DTCImageViewController.h
//  gemelas
//
//  Created by David de Tena on 06/04/15.
//  Copyright (c) 2015 David de Tena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTCImageViewController : UIViewController

#pragma mark - Properties
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

#pragma mark - Actions
- (IBAction)downloadImage:(id)sender;


@end
