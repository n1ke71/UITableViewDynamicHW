//
//  DataModel.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 03.07.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "DataModel.h"
#import "KStudent.h"
#import "KColorModel.h"
#import "KGroup.h"
#import "KGroupModels.h"

@implementation DataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.dataForTableView = [self makeData];
    }
    return self;
}


- (KGroup *) makeGroupOfStudentsWithName:(NSString *) groupName {
    
    KGroup *groupStudents = [[KGroup alloc]init];
    groupStudents.students = [NSMutableArray array];
    groupStudents.name = groupName;
    
    return groupStudents;
}

- (KGroupModels *) makeGroupOfModelsWithName:(NSString *) groupName {
    
    KGroupModels *groupModels = [[KGroupModels alloc]init];
    groupModels.modelsOfColors = [NSMutableArray array];
    groupModels.name = groupName;
    
    for (int i = 0; i < 10; i++) {
        KColorModel *model = [[KColorModel alloc]init];
        [groupModels.modelsOfColors addObject: model];
    }
    
    return groupModels;
}

- (NSArray *) makeData{
    
    KGroup *groupScoreExellent = [self makeGroupOfStudentsWithName:@"ScoreExellent"];
    KGroup *groupScoreGood = [self makeGroupOfStudentsWithName:@"ScoreGood"];
    KGroup *groupScoreSatisfactionly = [self makeGroupOfStudentsWithName:@"ScoreSatisfactionly"];
    KGroup *groupScoreBad = [self makeGroupOfStudentsWithName:@"ScoreBad"];
    
    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        
        for (int i = 0;  i < 30; i++) {
            
            KStudent *student = [[KStudent alloc]init];
            
            switch (student.studentScore) {
                case StudentScoreExellent:
                    [groupScoreExellent.students addObject:student];
                    break;
                case StudentScoreGood:
                    [groupScoreGood.students addObject:student];
                    break;
                case StudentScoreSatisfactionly:
                     [groupScoreSatisfactionly.students addObject:student];
                    break;
                case StudentScoreBad:
                    [groupScoreBad.students addObject:student];
                    break;
                default:
                    break;
            }
        }
        groupScoreExellent.students = [NSMutableArray arrayWithArray: [groupScoreExellent sortByName]];
        groupScoreGood.students = [NSMutableArray arrayWithArray: [groupScoreGood sortByName]];
        groupScoreSatisfactionly.students = [NSMutableArray arrayWithArray: [groupScoreSatisfactionly sortByName]];
        groupScoreBad.students = [NSMutableArray arrayWithArray: [groupScoreBad sortByName]];
    });
    
    
    KGroupModels *groupModels = [self makeGroupOfModelsWithName:@"RGB models"];
    NSArray *content = [NSArray arrayWithObjects:groupScoreExellent,
                                                 groupScoreGood,
                                                 groupScoreSatisfactionly,
                                                 groupScoreBad,
                                                 groupModels, nil];
    return content;
}
@end
