//
//  ViewController.m
//  GestureExamples
//
//  Created by Nick Reeder on 12/15/14.
//  Copyright (c) 2014 Nick Reeder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    CGRect luigis_frame = CGRectMake(0, 0, 160, 160);
    
    self.luigi_image = [[UIImageView alloc] initWithFrame:luigis_frame];
    
    self.luigi_image.image = [UIImage imageNamed:@"luigi_image_360.png"];
    
    self.luigi_image.center = self.view.center;
    
    [self.view addSubview:self.luigi_image];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapLuigi = [[UITapGestureRecognizer alloc]
                                        initWithTarget: self action: @selector(tapLuigiDetected:)];
    tapLuigi.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapLuigi];
    
    UISwipeGestureRecognizer *left_swipe_luigi = [[UISwipeGestureRecognizer alloc]
                                                  initWithTarget:self action:@selector(leftSwipeLuigiDetected:)];
    left_swipe_luigi.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:left_swipe_luigi];
    
    UISwipeGestureRecognizer *right_swipe_luigi = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(rightSwipeLuigiDetected:)];
    right_swipe_luigi.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:right_swipe_luigi];
    
    UILongPressGestureRecognizer *long_press_luigi = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressLuigiDetected:)];
    long_press_luigi.minimumPressDuration = 3;
    long_press_luigi.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:long_press_luigi];
    
    
    UIScreenEdgePanGestureRecognizer *pan_luigi = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(luigiScreenPanDetected:)];
    pan_luigi.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:pan_luigi];
    
    UIPanGestureRecognizer *luigi_pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(luigiPanDetected:)];
    [self.view addGestureRecognizer:luigi_pan];
    
}

-(void) tapLuigiDetected:(UIGestureRecognizer *)gesture {
    
    
    self.luigi_image.hidden = !self.luigi_image.hidden;
    
}

-(void) leftSwipeLuigiDetected:(UIGestureRecognizer *)gesture {
    
    [UIView animateWithDuration:1 animations:^{
        self.luigi_image.alpha = 0;
    }];
    
}

-(void) rightSwipeLuigiDetected:(UIGestureRecognizer *)gesture {
    
    [UIView animateWithDuration:1 animations:^{
        self.luigi_image.alpha = 1;
    }];
    
}

-(void) longPressLuigiDetected:(UIGestureRecognizer *)gesture {
    
    CGRect newFrame = self.luigi_image.frame;
    newFrame.size.height = 50;
    newFrame.size.width  = 50;
    
    [UIView animateWithDuration:1 animations:^{
        self.luigi_image.frame = newFrame;
        self.luigi_image.center = self.view.center;
    }];
    
   
}

-(void) luigiScreenPanDetected:(UIGestureRecognizer *)gesture {
    
    CGRect newFrame = self.luigi_image.frame;
    newFrame.size.height = 160;
    newFrame.size.width  = 160;
    
    [UIView animateWithDuration:1 animations:^{
        self.luigi_image.frame = newFrame;
        self.luigi_image.center = self.view.center;
    }];
    
}

-(void) luigiPanDetected:(UIGestureRecognizer *)gesture {
    
    CGPoint tapPoint = [gesture locationInView:self.view];
    
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        self.currentPosition = self.luigi_image.center;
        
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        
        self.luigi_image.center = tapPoint;
        
    } else if (gesture.state == UIGestureRecognizerStateEnded) {
        
        [UIView animateWithDuration:1 animations:^{
            self.luigi_image.center = self.currentPosition;
        }];
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
