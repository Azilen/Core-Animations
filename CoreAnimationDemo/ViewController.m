//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by Kirit Vaghela on 6/25/15.
//  Copyright (c) 2015 Azilen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

#define duration 3.0

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    switch (self.indexPath.section) {
            
            // ALPHA
        case 0:{
            
            switch (self.indexPath.row) {
                    
                    // show
                case 0:{
                    
                    //hide imageView first
                    self.imageView.alpha = 0;
                    
                    // now show using animation
                    [self showimageView];
                    
                }break;
                
                    // hide
                case 1:{
                    [self hideimageView];
                    
                }break;
                    
                    // show hide
                case 2:{
                    
                    //hide imageView first
                    self.imageView.alpha = 0;
                    
                    [self showHideimageView];
                    
                }break;
                    
                case 3:{
                    
                    [self showHideInfite];
                    
                }break;
                    
                
                default:
                    break;
            }
            
        }break;
            
            
            // TRANSFORM - Scale
        case 1:{
            
            switch (self.indexPath.row) {
                    
                    // scale up
                case 0:{
                    [self transformScaleUp];
                }break;
                    
                    //rotate down
                case 1:{
                    [self transformScaleDown];
                    
                }break;
                    
                case 2:{
                    [self transformScaleUpDown];
                }break;
                    
                case 3:{
                    [self transformScaleUpDownWithAlpha];
                }
                    
                default:
                    break;
            }
            
        }break;
            
            // TRANSFORM - Rotate
        case 2:{
            
            switch (self.indexPath.row) {
                case 0:{
                    
                    [self transformRotate];
                }break;
                    
                case 1:{
                    [self transformRotateAndScale];
                }break;
                    
                case 2:{
                    [self transformRotateAndScaleWithAlpha];
                }break;
                    
                case 3:{
                    [self transformRotateAndScaleWithAlphaInfinite];
                }break;
                    
                case 4:{
                    [self flipHorizontal];
                }break;
                    
                case 5:{
                    [self flipVertical];

                }break;
    
                default:
                    break;
            }
            
        }break;
            
        default:
            break;
    }

    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)showimageView{
    
    // show
    [UIView animateWithDuration:duration animations:^{
        self.imageView.alpha = 1.0;
    }];
}

-(void)hideimageView{
    
    // hide
    [UIView animateWithDuration:duration animations:^{
        self.imageView.alpha = 0.0;
    }];
}

-(void)showHideimageView{

    // show
    [UIView animateWithDuration:duration
                     animations:^{

            self.imageView.alpha = 1.0;
                         
        } completion:^(BOOL finished){
        
            // hide
            [self hideimageView];
        
    }];
    
}
-(void)showHideInfite{
    
    self.imageView.alpha = 1.0;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.imageView.alpha = 0.0;
                         
                     } completion:nil];
    
    
    
}

-(void)transformScaleUp{
    
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.imageView.transform = CGAffineTransformMakeScale(2, 2);
                     } completion:nil];
    
}

-(void)transformScaleDown{
    
    self.imageView.transform = CGAffineTransformMakeScale(2, 2);
    
    [UIView animateWithDuration:duration
                     animations:^{
                         self.imageView.transform = CGAffineTransformMakeScale(1, 1);
                     } completion:nil];
}

-(void)transformScaleUpDown{
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(2, 2);
                         
                     } completion:nil];
    
}
-(void)transformScaleUpDownWithAlpha{
    
    self.imageView.alpha = 0.1;
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         self.imageView.alpha = 1.0;
                         self.imageView.transform = CGAffineTransformMakeScale(2, 2);

                     } completion:nil];
}

-(void)transformRotate{
    
    [UIView animateWithDuration:duration
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeRotation( 180 * M_PI  / 180);
                         
                     } completion:nil];
    
}

-(void)transformRotateAndScale{
    
    [UIView animateWithDuration:duration
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(3, 3);
                         self.imageView.transform = CGAffineTransformMakeRotation( 180 * M_PI  / 180);
                         
                     } completion:nil];
    
}

-(void)transformRotateAndScaleWithAlpha{
    
    [UIView animateWithDuration:duration
                     animations:^{
                         
                         self.imageView.alpha = 0.1;
                         self.imageView.transform = CGAffineTransformMakeScale(3, 3);
                         self.imageView.transform = CGAffineTransformMakeRotation( 180 * M_PI  / 180);
                         
                     } completion:nil];
    
}

-(void)transformRotateAndScaleWithAlphaInfinite{
    
        [UIView animateWithDuration:0.5
                              delay:0
                            options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction)
                         animations:^{
                             self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI);
                             
        } completion:^(BOOL finished) {
            
            if (finished && !CGAffineTransformEqualToTransform(self.imageView.transform, CGAffineTransformIdentity)) {
                
                [self transformRotateAndScaleWithAlphaInfinite];
            }
        }];
    
    return;
    
    
}
-(void)flipHorizontal{
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(-3, 3);
                         
                         
                     } completion:nil];
    
}

-(void)flipVertical{
 
    [UIView animateWithDuration:duration
                          delay:0
                        options:(UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         
                         self.imageView.transform = CGAffineTransformMakeScale(3, -3);
                         
                         
                     } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
