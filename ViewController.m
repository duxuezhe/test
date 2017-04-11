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

#pragma  mark - tableView数据源方法
#pragma  mark - 设置section
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return persons.count;
}

#pragma  mark - 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma  mark - 设置cell 显示的内容
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

#pragma mark 选择某行后调用的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建提示框
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"你被选中了!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消",nil];
    //设置AlertView的风格为能显示的输入框
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    Person *p = [[Person alloc]init];
    p = self.persons[indexPath.row];
    [alert textFieldAtIndex:0].text = p.name;
    alert.tag = indexPath.row;
    
    [alert show];
}
#pragma mark 取消某行后调用的方法
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"取消第%d行",indexPath.row+1);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
