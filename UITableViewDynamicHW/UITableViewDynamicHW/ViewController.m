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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    self.tableContents = [self makeData];
   
}

#pragma mark - Methods

- (KGroup *) makeGroupOfStudentsWithName:(NSString *) groupName {
    
    KGroup *groupStudents = [[KGroup alloc]init];
    groupStudents.students = [NSMutableArray array];
    groupStudents.name = groupName;
    
    return groupStudents;
}

- (KGroupModels *) makeGroupOfModelsWithName:(NSString *) groupName {
    
    KGroupModels *groupModels = [[KGroupModels alloc]init];
    groupModels.models = [NSMutableArray array];
    groupModels.name = groupName;

    return groupModels;
}

- (NSMutableArray *) makeData{
    
    KGroup *groupScoreExellent = [self makeGroupOfStudentsWithName:@"ScoreExellent"];
    KGroup *groupScoreGood = [self makeGroupOfStudentsWithName:@"ScoreGood"];
    KGroup *groupScoreSatisfactionly = [self makeGroupOfStudentsWithName:@"ScoreSatisfactionly"];
    KGroup *groupScoreBad = [self makeGroupOfStudentsWithName:@"ScoreBad"];

    dispatch_queue_t backgroundQueue = dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0);
    
    dispatch_async(backgroundQueue, ^{
        
        for (int i = 0;  i < 30; i++) {
            
            KStudent *student = [[KStudent alloc]init];
            
            if (student.studentScore == StudentScoreExellent) {
                
                [groupScoreExellent.students addObject:student];
            }
            else if (student.studentScore == StudentScoreGood){
                
                [groupScoreGood.students addObject:student];
            }
            else if (student.studentScore == StudentScoreSatisfactionly){
                
                [groupScoreSatisfactionly.students addObject:student];
            }
            else if (student.studentScore == StudentScoreBad){
                
                [groupScoreBad.students addObject:student];
            }
            
        }

        groupScoreExellent.students = [groupScoreExellent nameSort];
        groupScoreGood.students = [groupScoreGood nameSort];
        groupScoreSatisfactionly.students = [groupScoreSatisfactionly nameSort];
        groupScoreBad.students = [groupScoreBad nameSort];
    });


    KGroupModels *groupModels = [self makeGroupOfModelsWithName:@"RGB models"];
    
    for (int i = 0; i < 10; i++) {
        
        KColorModel *model = [[KColorModel alloc]init];
        
        [groupModels.models addObject: model];
    }

    NSMutableArray *content = [NSMutableArray arrayWithObjects:groupScoreExellent,
                                                               groupScoreGood,
                                                               groupScoreSatisfactionly,
                                                               groupScoreBad,
                                                               groupModels, nil];
    return content;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.tableContents count];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger number = 0;
    id object = [self.tableContents objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup*) object;
        number = [group.students count];
        
    }
    else {
        
        KGroupModels *groupModel = (KGroupModels*) object;
        number = [groupModel.models count];
    }
    
    return number;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title;

    id object = [self.tableContents objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup*) object;
        title = group.name;
    }
    else {
        
        KGroupModels *groupModel = (KGroupModels*) object;
        title = groupModel.name;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idStudent = @"idStudentCell";
    static NSString *idModel   = @"idModelCell";
    UITableViewCell *cell;
    
    id object = [self.tableContents objectAtIndex:indexPath.section];
    
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
    
    else {
        
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
