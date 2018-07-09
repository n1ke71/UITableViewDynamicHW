//
//  KGroupModels.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KGroupModels.h"
#import "KColorModel.h"
@implementation KGroupModels

+ (KGroupModels *) makeGroupOfModels {
    
    KGroupModels *groupModels = [[KGroupModels alloc]init];
    groupModels.modelsOfColors = [NSMutableArray array];
    groupModels.name = @"RGB models";
    
    for (int i = 0; i < 10; i++) {
        KColorModel *model = [[KColorModel alloc]init];
        [groupModels.modelsOfColors addObject: model];
    }
    
    return groupModels;
}

@end
