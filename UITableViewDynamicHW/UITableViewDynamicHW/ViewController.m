//
//  ViewController.m
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 20.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import "ViewController.h"
#import "KStudent.h"
#import "KColorModel.h"
#import "KGroup.h"
#import "KGroupModels.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *modelName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    

    KGroup *groupScoreExellent = [[KGroup alloc]init];
    groupScoreExellent.students = [NSMutableArray array];
    groupScoreExellent.name = @"ScoreExellent";
    
    KGroup *groupStudentScoreGood = [[KGroup alloc]init];
    groupStudentScoreGood.students = [NSMutableArray array];
    groupStudentScoreGood.name = @"ScoreGood";
    
    KGroup *groupStudentScoreSatisfactionly = [[KGroup alloc]init];
    groupStudentScoreSatisfactionly.students = [NSMutableArray array];
    groupStudentScoreSatisfactionly.name = @"ScoreSatisfactionly";
    
    KGroup *groupStudentScoreBad = [[KGroup alloc]init];
    groupStudentScoreBad.students = [NSMutableArray array];
    groupStudentScoreBad.name = @"ScoreBad";
    
    NSMutableArray *studentsArray = [NSMutableArray array];
    
    for (int i = 0;  i < 30; i++) {
        
        KStudent *student = [[KStudent alloc]init];
        
        [studentsArray addObject: student];

    }

    groupScoreExellent.students = [self sortingByScore: studentsArray byScore: StudentScoreExellent];
    groupStudentScoreGood.students = [self sortingByScore: studentsArray byScore: StudentScoreGood];
    groupStudentScoreSatisfactionly.students = [self sortingByScore: studentsArray byScore: StudentScoreSatisfactionly];
    groupStudentScoreBad.students = [self sortingByScore: studentsArray byScore: StudentScoreBad];
    

    KGroupModels *groupModels = [[KGroupModels alloc]init];
    groupModels.name = @"RGB Models";
    groupModels.models = [NSMutableArray array];
    
    for (int i = 0; i < 10; i++) {
        
        KColorModel *model = [[KColorModel alloc]init];
        model.modelColor = [self randomColor];
        model.modelNameRGBA = self.modelName;
        
        [groupModels.models addObject: model];
    }
    
    self.objects = [NSMutableArray arrayWithObjects:groupScoreExellent,
                                                    groupStudentScoreGood,
                                                    groupStudentScoreSatisfactionly,
                                                    groupStudentScoreBad,
                                                    groupModels, nil];
    
}

#pragma mark - Methods

- (NSArray *)sortingArrayByName:(NSArray *)array{
    
    NSArray *sortedArrayByName = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        KStudent *student1 = (KStudent *) obj1;
        KStudent *student2 = (KStudent *) obj2;
        
        return [student1.firstName compare:student2.firstName];
        
    }];

    return sortedArrayByName;
}
- (NSMutableArray *)sortingByScore:(NSMutableArray *)studentsArray byScore:(StudentScore) score{

    NSMutableArray *sortedArrayByScore = [NSMutableArray array];
    
    for (KStudent *student in studentsArray) {
        
        if (student.studentScore == score) {
            
            student.scoreColor = [self scoreColor: student.studentScore];
            
            [sortedArrayByScore addObject: student];
        }
    }
    
    NSArray *array = [NSArray arrayWithArray:sortedArrayByScore];
    [sortedArrayByScore removeAllObjects];
    [sortedArrayByScore addObjectsFromArray: [self sortingArrayByName:array]];
    
    return sortedArrayByScore;
}

- (UIColor*) scoreColor:(StudentScore) score{
    
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


- (UIColor*)randomColor {
    
    CGFloat r = arc4random() % 256;
    CGFloat g = arc4random() % 256;
    CGFloat b = arc4random() % 256;
    
    self.modelName = [NSString stringWithFormat:@"RGB (%.0f,%.0f,%.0f)",r,g,b];
    
    return  [UIColor colorWithRed: r/255. green: g/255. blue: b/255. alpha: 1.];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.objects count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger number = 0;
    
    id object = [self.objects objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup*) object;
        
        number = [group.students count];
        
    }
    else if([object isKindOfClass:[KGroupModels class]]){
        
        KGroupModels *groupModel = (KGroupModels*) object;
        
        number = [groupModel.models count];
    }
    
    return number;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title;

    id object = [self.objects objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup*) object;
        
        title = group.name;
        
    }
    else if([object isKindOfClass:[KGroupModels class]]){
        
        KGroupModels *groupModel = (KGroupModels*) object;
        
        title = groupModel.name;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idStudent = @"idStudentCell";
    static NSString *idModel   = @"idModelCell";
    UITableViewCell *cell;
    
    id object = [self.objects objectAtIndex:indexPath.section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup*) object;
        
        KStudent *student = [group.students objectAtIndex:indexPath.row];
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:idStudent];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idStudent];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",student.firstName,student.lastName];
        
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%u",student.studentScore];
        
        cell.backgroundColor = student.scoreColor;
        
    }
    
    else if([object isKindOfClass:[KGroupModels class]]){
        
        KGroupModels *groupModel = (KGroupModels*)object;
        
        KColorModel *model = [groupModel.models objectAtIndex:indexPath.row];
        
        cell = [self.tableView dequeueReusableCellWithIdentifier:idModel];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idModel];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@",model.modelNameRGBA];
        
        cell.backgroundColor = model.modelColor;
    }
    

    return cell;
}
@end
