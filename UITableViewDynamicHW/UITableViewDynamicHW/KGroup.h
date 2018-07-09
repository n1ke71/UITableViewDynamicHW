//
//  KGroup.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KStudent.h"

@interface KGroup : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *students;

- (void)sortByName;
+ (KGroup *) makeGroupWithScore:(StudentScore) studentScore;
+ (NSString *) groupNameByScore:(StudentScore) studentScore;
@end
