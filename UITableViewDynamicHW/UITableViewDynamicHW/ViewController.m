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
#import "DataModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 20, 0);
    
    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
    
    DataModel *dataModel = [[DataModel alloc]init];
    self.cellsArray = dataModel.dataForTableView;
   
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return [self.cellsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger number = 0;
    id object = [self.cellsArray objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup *) object;
        number = [group.students count];
        
    }else{
        
        KGroupModels *groupModel = (KGroupModels *) object;
        number = [groupModel.modelsOfColors count];
    }
    
    return number;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSString *title;

    id object = [self.cellsArray objectAtIndex:section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup *) object;
        title = group.name;
        
    }else {
        
        KGroupModels *groupModel = (KGroupModels *) object;
        title = groupModel.name;
    }
    
    return title;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *idStudent = @"idStudentCell";
    static NSString *idModel   = @"idModelCell";
    UITableViewCell *cell;
  //  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:idStudent];
  //  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:idModel];
    
    id object = [self.cellsArray objectAtIndex:indexPath.section];
    
    if ([object isKindOfClass:[KGroup class]]) {
        
        KGroup *group = (KGroup *) object;
        KStudent *student = [group.students objectAtIndex:indexPath.row];
       // cell = [self.tableView dequeueReusableCellWithIdentifier:idStudent forIndexPath:indexPath];
        cell = [self.tableView dequeueReusableCellWithIdentifier:idStudent];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:idStudent];
        }
        
        cell.textLabel.text = [student description];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",student.studentScore];
        cell.backgroundColor = [student scoreColor:student.studentScore];
       
    }else {
        
        KGroupModels *groupModel = (KGroupModels *)object;
        KColorModel *model = [groupModel.modelsOfColors objectAtIndex:indexPath.row];
       // cell = [self.tableView dequeueReusableCellWithIdentifier:idModel forIndexPath:indexPath];
        cell = [self.tableView dequeueReusableCellWithIdentifier:idModel];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idModel];
       }
        
        cell.textLabel.text = [model description];
        cell.backgroundColor = model.rgbColor;
      
    }
    
   return cell;
}
@end
