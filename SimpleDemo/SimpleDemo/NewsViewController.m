//
//  NewsViewController.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/17.
//  Copyright © 2019 zz. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView;
    })];
}

#pragma mark tableView's delegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.textLabel.text = [NSString stringWithFormat:@"新闻 - %@",@(indexPath.row)];
    cell.imageView.image = [UIImage imageNamed:@"icon.bundle/video@2x.png"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"新闻副标题 - %@",@(indexPath.row)];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailViewController *detailViewController = [[NewsDetailViewController alloc] init];
    detailViewController.title = [NSString stringWithFormat:@"文章- %@",@(indexPath.row)];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark tableView's dataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"newsCell"];
    }
    
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
