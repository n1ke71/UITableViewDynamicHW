//
//  KColorModel.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KColorModel.h"


@implementation KColorModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modelColor = [self randomColor];
    }
    return self;
}

- (UIColor *)randomColor {
    
    self.redComponent = arc4random() % 256;
    self.greenComponent = arc4random() % 256;
    self.blueComponent = arc4random() % 256;
    self.modelNameRGBA = [NSString stringWithFormat:@"RGB (%.0f,%.0f,%.0f)",self.redComponent,self.greenComponent,self.blueComponent];
    
return  [UIColor colorWithRed: self.redComponent /255. green: self.greenComponent /255. blue: self.blueComponent /255. alpha: 1.];
}

@end
