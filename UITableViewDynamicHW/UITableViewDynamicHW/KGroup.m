//
//  KGroup.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KGroup.h"
#import "KStudent.h"

@implementation KGroup

- (NSMutableArray *)nameSort{
    
    NSArray *sortedArrayByName = [[self.students copy] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        KStudent *student1 = (KStudent *) obj1;
        KStudent *student2 = (KStudent *) obj2;
        
    return [student1.firstName compare:student2.firstName];
        
    }];
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:sortedArrayByName];
    
    return result;
}

@end
