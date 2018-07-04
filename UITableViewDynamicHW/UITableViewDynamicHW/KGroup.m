//
//  KGroup.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 21.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KGroup.h"


@implementation KGroup

- (void)sortByName{
    
    NSArray *sortedArrayByName = [[self.students copy] sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        KStudent *student1 = (KStudent *) obj1;
        KStudent *student2 = (KStudent *) obj2;
        
    return [student1.firstName compare:student2.firstName];
        
    }];
    
    self.students = [NSMutableArray arrayWithArray:sortedArrayByName];
}


+ (KGroup *) makeGroupWithName:(NSString *) groupName andScore:(StudentScore) studentScore{
    
    KGroup *groupStudents = [[KGroup alloc]init];
    groupStudents.students = [NSMutableArray array];
    groupStudents.name = groupName;
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        
        for (int i = 0;  i < 30; i++) {
            
            KStudent *student = [KStudent randomStudent];
            
            if (student.studentScore == studentScore) {
                [groupStudents.students addObject:student];
            }
        }
        
        [groupStudents sortByName];
        
    });
    
    return groupStudents;
}
@end
