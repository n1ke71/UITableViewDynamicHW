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

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
        self.firstName    = firstNames[arc4random_uniform(15)];
        self.lastName     = lastNames[arc4random_uniform(15)];
        self.studentScore = (StudentScore)arc4random_uniform(4) + 2;
     
      //  NSLog(@"self.studentScore = %d",self.studentScore);
   
    }
    return self;
}
@end
