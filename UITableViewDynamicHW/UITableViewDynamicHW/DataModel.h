//
//  DataModel.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 03.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (strong, nonatomic) NSArray *dataForTableView;

- (NSArray *) makeData;

@end
