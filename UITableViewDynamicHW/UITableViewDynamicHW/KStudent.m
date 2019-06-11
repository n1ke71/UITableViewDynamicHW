//
//  KStudent.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 20.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "KStudent.h"

static NSString* firstNames[] = { @"Tran",@"Lenore",@"Bud",@"Fredda",@"Katrise",
    @"Hildegard",@"Vernell",@"Nellie",@"Rupert",@"Billie",
    @"Tamica",@"Crystle",@"Kandy",@"Caridad",@"Vanetta"
    
};


static NSString* lastNames[] = { @"Farrah",@"Laviolette",@"Heal",@"Sechrest",@"Roots",
    @"Prill",@"Lush",@"Piedra",@"Yocum",@"Warnock",
    @"Vanderlinden",@"Simms",@"Gilroy",@"Brann",@"Bodden"
};


@implementation KStudent

static unsigned int countFirstNames = sizeof(firstNames) / sizeof(firstNames[0]);
static unsigned int countlastNames  = sizeof(lastNames) / sizeof(lastNames[0]);

+ (KStudent *) randomStudent{
    
    KStudent *student = [[KStudent alloc]init];
    student.firstName    = firstNames[arc4random_uniform(countFirstNames)];
    student.lastName     = lastNames[arc4random_uniform(countlastNames)];
    student.studentScore = (StudentScore)arc4random_uniform(4) + 2;

    return student;
}

- (UIColor *) scoreColor:(StudentScore) score{
    
    switch (score) {
        case StudentScoreExellent:
            return  [UIColor greenColor];
        case StudentScoreGood:
            return  [UIColor orangeColor];
        case StudentScoreSatisfactionly:
            return  [UIColor yellowColor];
        case StudentScoreBad:
            return  [UIColor redColor];
        default:break;
    }
}

- (NSString *) description{

    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
