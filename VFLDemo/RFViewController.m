//
//  RFViewController.m
//  VFLDemo
//
//  Created by 王若风 on 24/02/2017.
//  Copyright © 2017 王若风. All rights reserved.
//

#import "RFViewController.h"

@interface RFViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RFViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"VFL Demo";

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:self.tableView];
    
}

- (NSArray *)content {
    return @[
             @{@"description": @"Two Views",
               @"class":@"RFFirstController"},
             @{@"description": @"Three Views",
               @"class":@"RFSecondController"},
             @{@"description": @"WebView + ToolBar",
               @"class": @"RFThirdController"},
             @{@"description":@"Standard Space",
               @"class": @"RFStandardSpaceController"},
             @{@"description":@"Width Constraint",
               @"class": @"RFWidthConstraintController"},
             @{@"description":@"Connection to Superview",
               @"class": @"RFConnectionToSuperviewController"},
             @{@"description":@"Vertical Layout",
               @"class": @"RFVerticalLayoutController"},
             @{@"description":@"Flush Views",
               @"class": @"RFFlushViewsController"},
             @{@"description":@"Priority Controller",
               @"class": @"RFPriorityController"},
             @{@"description":@"Equal Widths",
               @"class": @"RFEqualWidthsController"},
             @{@"description":@"Multiple Predicates",
               @"class": @"RFMultiplePredicatesController"},
             @{@"description":@"A Complete Line of Layout",
               @"class": @"RFCompleteLineLayoutController"},
             @{@"description":@"NSLayoutAnchor Example",
               @"class": @"RFLayoutAnchorController"}
             ];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self content].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [self content][indexPath.row][@"description"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *targetClass = [self content][indexPath.row][@"class"];
    Class controllerClass = NSClassFromString(targetClass);
    
    UIViewController *targetController = [[controllerClass class] new];
    
    [self.navigationController pushViewController:targetController animated:YES];
}

@end
