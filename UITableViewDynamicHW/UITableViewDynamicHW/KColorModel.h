//
//  KColorModel.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface KColorModel : NSObject

@property (strong, nonatomic) NSString *modelNameRGBA;
@property (assign, nonatomic) CGFloat redComponent;
@property (assign, nonatomic) CGFloat greenComponent;
@property (assign, nonatomic) CGFloat blueComponent;
@property (strong, nonatomic) UIColor *modelColor;

- (UIColor*)randomColor;

@end
