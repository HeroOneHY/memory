//
//  ViewController.m
//  Memory
//
//  Created by yanhe on 2018/4/19.
//  Copyright © 2018年 yanhe. All rights reserved.
//

#import "ViewController.h"
#define key @"cell"
#import "infoViewController.h"
#import "info.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, weak)UITableView *tabview;
@property(nonatomic, strong)NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpData];
    [self setUp];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)setUpData{
     NSString *path = [[NSBundle mainBundle] pathForResource:@"memory" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *dataArray = dic[@"data"];
    self.dataArray = dataArray;
}
-(void)setUp{
    UITableView *tabView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tabview = tabView;
    [tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:key];
    tabView.delegate = self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:key];
    cell.textLabel.text = self.dataArray[indexPath.row][@"item"];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    infoViewController *vc = [[infoViewController alloc]initWithImage:[info getImageWithName:indexPath.row]];
    [self presentViewController:vc animated:NO completion:nil];
}
@end
