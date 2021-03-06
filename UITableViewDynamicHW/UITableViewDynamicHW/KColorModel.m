//
//  KColorModel.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KColorModel.h"

@interface KColorModel()

@property (assign, nonatomic) CGFloat redComponent;
@property (assign, nonatomic) CGFloat greenComponent;
@property (assign, nonatomic) CGFloat blueComponent;

@end

@implementation KColorModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.rgbColor = [self randomColor];
    }
    return self;
}

- (UIColor *)randomColor {
    
    self.redComponent = arc4random() % 256;
    self.greenComponent = arc4random() % 256;
    self.blueComponent = arc4random() % 256;
    
return  [UIColor colorWithRed: self.redComponent /255. green: self.greenComponent /255. blue: self.blueComponent /255. alpha: 1.];
}

- (NSString *)description{
    
    return [NSString stringWithFormat:@"RGB (%.0f,%.0f,%.0f)",self.redComponent,self.greenComponent,self.blueComponent];
}
@end
