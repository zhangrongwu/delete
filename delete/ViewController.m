//
//  ViewController.m
//  delete
//
//  Created by zhangrongwu on 2017/9/25.
//  Copyright © 2017年 ENN. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end
@implementation ViewController
#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setNav];
    [self getData];
}


#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    cell.tintColor = [UIColor redColor];
    cell.contentView.tintColor = [UIColor redColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (nullable UISwipeActionsConfiguration *)tableView:(UITableView *)tableView leadingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"置顶" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        completionHandler (YES);
    }];
    deleteRowAction.image = [UIImage imageNamed:@"Color"];
    deleteRowAction.backgroundColor = [UIColor cyanColor];
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];    return config;
}
- ( UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //删除
    
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
        
        completionHandler (YES);
        
    }];
    
    deleteRowAction.image = [UIImage imageNamed:@"Color"];
    
    deleteRowAction.backgroundColor = [UIColor redColor];
    
    
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
    
    return config;
    
}

#pragma mark - CustomDelegate
// 外部代理
#pragma mark - event response
// 按钮点击方法
#pragma mark - private methods
// 设置页面布局
- (void)setUI {
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}
// 设置navigation
- (void)setNav {
    
}
// 网络请求
- (void)getData {
    
}

#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.userInteractionEnabled = YES;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
