//
//  NewsViewController.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/17.
//  Copyright © 2019 zz. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"
#import "NewsTableViewCell.h"
#import "FCview.h"


@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource, NiewsTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong, readwrite) NSMutableArray *dataArray;

@end

@implementation NewsViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"资讯";
        //bundle的使用，因为bundle是静态的，不进行编译的资源文件。所以，要使用bundle中的资源，就需要找到相应的资源路径。
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page.png"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected@2x"];
        self.view.backgroundColor = [UIColor whiteColor];
        
        _dataArray = [[NSMutableArray alloc] initWithCapacity:20];
        for (int i = 0; i < 20; i++) {
            [_dataArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
       self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView;
    })];
    
}

#pragma mark - NiewsTableViewCellDelegate's delegate
- (void)clickedCell:(UITableViewCell *)cell WithButton:(UIButton *)deletaButton
{
    NSLog(@"添加视图显示");
    
    CGPoint point = [cell convertPoint:deletaButton.center toView:self.view];
    
    FCview *view = [[FCview alloc] initWithFrame:self.view.bounds];
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    __weak typeof(self) wself = self;
    
    [view showFCviewFromInitPoint:point WithClickedBlock:^(){
        NSLog(@"执行我想要执行的");
        __strong typeof(wself) strongself = wself;
        [strongself.dataArray removeObjectAtIndex:indexPath.row];
        [strongself.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
        
    }];
    
}

#pragma mark tableView's delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] init];
//    detailViewController.title = [NSString stringWithFormat:@"文章- %@",@(indexPath.row)];
    [self.navigationController pushViewController:detailViewController animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO];
}


#pragma mark tableView's dataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    if (!cell) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
        cell.delegate = self;
    }
    [cell layoutCell];
   
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
 // Pass the selected obj- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {

 }

 ect to the new view controller.
}
*/

@end