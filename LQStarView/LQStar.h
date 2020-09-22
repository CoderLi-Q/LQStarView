//
//  LQStar.h
//  LQStarView
//
//  Created by Schaffer on 2020/9/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LQStar : UIView
//五角星的中心点坐标
@property (nonatomic, assign) CGPoint centerPoint;

/**
 五角星一个角的坐标
 */
@property (nonatomic, assign) CGPoint aCorner;

/**
 给一个范围画一个最大的五角星,不能超出本视图大小
 * 如果设置了这个属性,aCorner和centerPoint将失去效果
 * 如果aCorner和centerPoint也没有设置,将会有一个默认的位置和大小
 
 */
@property (nonatomic, assign) CGRect contentRect;
@end

NS_ASSUME_NONNULL_END
