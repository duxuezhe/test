//
//  ViewController.m
//  test
//
//  Created by duxuezhe on 17-4-10.
//  Copyright (c) 2017年 duxuezhe. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#define personNum 20

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
@implementation ViewController
@synthesize persons;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.persons = [[NSMutableArray alloc]init];
    for (int i = 0; i < personNum; i++) {
        Person *p = [[Person alloc]init];
        p.name = [NSString stringWithFormat:@"%d",i+1];
        p.telephone = [NSString stringWithFormat:@"1507607%04d",arc4random()%1000];
        p.face = [NSString stringWithFormat:@"%d.png",i+1];
        [self.persons addObject:p];
        
    }
	self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return persons.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //1.创建UITableViewCell的对象
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    //2.设置数据
    Person *p = self.persons[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.telephone;
    [cell.imageView setImage:[UIImage imageNamed:p.face]];

    //设置辅助指引试图
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
