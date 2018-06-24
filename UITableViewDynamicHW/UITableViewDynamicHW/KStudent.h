//
//  KStudent.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 20.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum{
    
 StudentScoreExellent = 5,
 StudentScoreGood = 4,
 StudentScoreSatisfactionly = 3,
 StudentScoreBad = 2
} StudentScore;

@interface KStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) StudentScore studentScore;
@property (strong, nonatomic) UIColor *scoreColor;

@end
