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
 
 StudentScoreBad = 2,
 StudentScoreSatisfactionly,
 StudentScoreGood,
 StudentScoreExellent,

} StudentScore;

@interface KStudent : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (assign, nonatomic) StudentScore studentScore;

- (UIColor *) scoreColor:(StudentScore) score;
- (NSString *) studentDescription:(NSString *) string;
@end
