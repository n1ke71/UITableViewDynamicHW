//
//  KGroupModels.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KGroupModels : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *modelsOfColors;

+ (KGroupModels *) makeGroupOfModels;

@end
