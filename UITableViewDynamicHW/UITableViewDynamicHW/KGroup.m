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
    
    NSArray *sortedArrayByName = [[self.students copy] sortedArrayUsingComparator:^NSComparisonResult(KStudent *obj1, KStudent *obj2) {
        
    return [obj1.firstName compare:obj2.firstName];
        
    }];
    
    self.students = [NSMutableArray arrayWithArray:sortedArrayByName];
}

+ (NSString *) groupNameByScore:(StudentScore) studentScore{
    switch (studentScore) {
        case StudentScoreExellent:
            return  @"ScoreExellent";
        case StudentScoreGood:
            return  @"ScoreGood";
        case StudentScoreSatisfactionly:
            return  @"ScoreSatisfactionly";
        case StudentScoreBad:
            return  @"ScoreBad";
        default:break;
    }
    
}

+ (KGroup *) makeGroupWithScore:(StudentScore) studentScore{
    
    KGroup *groupStudents = [[KGroup alloc]init];
    groupStudents.students = [NSMutableArray array];
    groupStudents.name = [KGroup groupNameByScore:studentScore];
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
