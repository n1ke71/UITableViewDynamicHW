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
    
    KGroup *groupScoreExellent = [KGroup makeGroupWithScore:StudentScoreExellent];
    KGroup *groupScoreGood = [KGroup makeGroupWithScore:StudentScoreGood];
    KGroup *groupScoreSatisfactionly = [KGroup makeGroupWithScore:StudentScoreSatisfactionly];
    KGroup *groupScoreBad = [KGroup makeGroupWithScore:StudentScoreBad];
    KGroupModels *groupModels = [KGroupModels makeGroupOfModels];
    
    NSArray *content = [NSArray arrayWithObjects:groupScoreExellent,
                                                 groupScoreGood,
                                                 groupScoreSatisfactionly,
                                                 groupScoreBad,
                                                 groupModels, nil];
    return content;
}
@end
