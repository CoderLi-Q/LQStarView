//
//  LQStar.m
//  LQStarView
//
//  Created by Schaffer on 2020/9/22.
//

#import "LQStar.h"
@interface LQStar ()

@end

@implementation LQStar

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGPoint point1 = CGPointZero;
    CGPoint center = CGPointZero;
    if(self.contentRect.size.height != 0){
        rect = self.contentRect;
        point1 = CGPointMake(rect.origin.x, rect.origin.y+rect.size.height/2.0);
        center = CGPointMake(rect.origin.x+rect.size.height/2.0, rect.origin.y+rect.size.height/2.0);
    } else if (self.centerPoint.x != 0 && self.centerPoint.y != 0 && self.aCorner.x != 0 && self.aCorner.y != 0){
        point1 = self.aCorner;
        center = self.centerPoint;
    }else{//默认
        //设五角星一点坐标
        //    CGPoint point1 = CGPointMake(10, 40);
        //    CGPoint point1 = CGPointMake(10, 10);
        //    CGPoint point1 = CGPointMake(40, 40);
        //    point1 = CGPointMake(rect.size.width, rect.size.height/2.0);//右侧中点
        //        point1 = CGPointMake(0, rect.size.height/2.0);//左侧中点
        //        point1 = CGPointMake(rect.size.width/2, rect.size.height);//底部侧中点
        point1 = CGPointMake(rect.size.width/2, 0);//顶部中点
        center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    }
    
    //计算圆半径
    CGFloat r = sqrt((center.x-point1.x)*(center.x-point1.x) + (center.y-point1.y)*(center.y-point1.y));
    //首先判断五角星所在圆是否在view内
    //    if([self roundIfOutRectWithCenter:center r:r rect:rect]){//超出边界不在画五角星
    NSAssert([self roundIfOutRectWithCenter:center r:r rect:rect] == NO, @"超出边界不再画五角星");
    //        return;
    //    }
    
    //角度alpha
    CGFloat alpha = asin((point1.y-center.y)/r);
    CGFloat alpha1 = acos((point1.x-center.x)/r);
    CGPoint point2 = CGPointZero;
    CGPoint point3 = CGPointZero;
    CGPoint point4 = CGPointZero;
    CGPoint point5 = CGPointZero;
    //这个是因为asin函数的象限决定的,反函数出来的角度不一定是真是的角度,所以有以下处理
    if (point1.x < center.x && point1.y == center.y) {
        alpha = alpha1;
    }else if (point1.x > center.x && point1.y == center.y){
        
    }else if(point1.x < center.x && point1.y < center.y){
        alpha = -1 *alpha + M_PI;
    }else if (point1.x < center.x && point1.y > center.y){
        alpha = alpha1;
    }
    
    point2 = CGPointMake(r*cos(alpha+72.0/180.0*M_PI)+center.x, r*sin(alpha+72.0/180.0*M_PI)+center.y);
    
    point3 = CGPointMake(r*cos(alpha+72.0*2/180.0*M_PI)+center.x, r*sin(alpha+72.0*2/180.0*M_PI)+center.y);
    point4 = CGPointMake(r*cos(alpha+72.0*3/180.0*M_PI)+center.x, r*sin(alpha+72.0*3/180.0*M_PI)+center.y);
    point5 = CGPointMake(r*cos(alpha+72.0*4/180.0*M_PI)+center.x, r*sin(alpha+72.0*4/180.0*M_PI)+center.y);
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:rect];
    [path moveToPoint:point1];
    [path addLineToPoint:point3];
    [path addLineToPoint:point5];
    [path addLineToPoint:point2];
    [path addLineToPoint:point4];
    [path addLineToPoint:point1];
    [[UIColor redColor] setStroke];
    [path stroke];

}


-(BOOL)roundIfOutRectWithCenter:(CGPoint)center r:(CGFloat)r rect:(CGRect)rect{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGPoint point1 =CGPointMake(width, center.y);
    CGPoint point2 =CGPointMake(0, center.y);
    CGPoint point3 =CGPointMake(center.x, height);
    CGPoint point4 =CGPointMake(0, height);
    
    if ([self isBiggerThan:r dis:[self distanceWith:point1 point:center]] &&
        [self isBiggerThan:r dis:[self distanceWith:point2 point:center]] &&
        [self isBiggerThan:r dis:[self distanceWith:point3 point:center]] &&
        [self isBiggerThan:r dis:[self distanceWith:point4 point:center]]) {
        return NO;
    }
    return YES;
}
-(CGFloat)distanceWith:(CGPoint)point1 point:(CGPoint)point2{
    return sqrt((point1.x-point2.x) * (point1.x-point2.x) + (point1.y-point2.y)*(point1.y-point2.y));
}
- (BOOL)isBiggerThan:(CGFloat)r dis:(CGFloat)distace{
    if (distace >= r) {
        return YES;
    }else{
        return NO;
    }
}
@end
