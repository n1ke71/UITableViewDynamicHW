//
//  ViewController.h
//  UITableViewDynamicHW
//
//  Created by Ivan Kozaderov on 20.06.2018.
//  Copyright © 2018 n1ke71. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(weak,nonatomic) IBOutlet UITableView* tableView;

@property (strong, nonatomic) NSMutableArray *objects;

@end

