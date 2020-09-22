//
//  ViewController.m
//  LQStarView
//
//  Created by Schaffer on 2020/9/22.
//

#import "ViewController.h"
#import "LQStar.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LQStar *start = [[LQStar alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    start.contentRect = CGRectMake(0, 0, 200, 200);
    start.aCorner = CGPointMake(10, 30);
    start.centerPoint = CGPointMake(50, 50);
    
    [self.view addSubview:start];
    start.backgroundColor = UIColor.lightGrayColor;
}


@end
