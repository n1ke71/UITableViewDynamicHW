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

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.firstName    = firstNames[arc4random_uniform(countFirstNames)];
        self.lastName     = lastNames[arc4random_uniform(countlastNames)];
        self.studentScore = (StudentScore)arc4random_uniform(4) + 2;
    }
    return self;
}

- (UIColor *) scoreColor:(StudentScore) score{
    
    switch (score) {
        case StudentScoreExellent:
            return  [UIColor greenColor];
            break;
        case StudentScoreGood:
            return  [UIColor orangeColor];
            break;
        case StudentScoreSatisfactionly:
            return  [UIColor yellowColor];
            break;
        case StudentScoreBad:
            return  [UIColor redColor];
            break;
        default:
            break;
    }
    
}

- (NSString *) studentDescription:(NSString *) string{

    
    if ([string isEqualToString:@"Fullname"]) {
        
        string = [NSString stringWithFormat:@"%@ %@",self.firstName,self.lastName];
        
    }else if ([string isEqualToString:@"Score"]){
        
        string = [NSString stringWithFormat:@"%u",self.studentScore];
    }
    
    return string;
}

@end
