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


- (NSArray *) makeData{
    
    KGroup *groupScoreExellent = [KGroup makeGroupWithName:@"ScoreExellent" andScore:StudentScoreExellent];
    KGroup *groupScoreGood = [KGroup makeGroupWithName:@"ScoreGood" andScore:StudentScoreGood];
    KGroup *groupScoreSatisfactionly = [KGroup makeGroupWithName:@"ScoreSatisfactionly" andScore:StudentScoreSatisfactionly];
    KGroup *groupScoreBad = [KGroup makeGroupWithName:@"ScoreBad" andScore:StudentScoreBad];
    
    KGroupModels *groupModels = [KGroupModels makeGroupOfModelsWithName:@"RGB models"];
    
    NSArray *content = [NSArray arrayWithObjects:groupScoreExellent,
                                                 groupScoreGood,
                                                 groupScoreSatisfactionly,
                                                 groupScoreBad,
                                                 groupModels, nil];
    return content;
}
@end
