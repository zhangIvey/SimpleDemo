//
//  VideoViewController.m
//  SimpleDemo
//
//  Created by yaoln on 2019/12/17.
//  Copyright © 2019 zz. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewCell.h"

@interface VideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation VideoViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video@2x"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected@2x"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 20;
        flowLayout.minimumInteritemSpacing = 20;
//        flowLayout.itemSize = CGSizeMake((self.view.bounds.size.width-20)/2, 300);
        flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.width/16*9);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[VideoViewCell class] forCellWithReuseIdentifier:@"videoCell"];
        collectionView;
    })];
    
}


#pragma mark  - collectionView's dataSource methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"videoCell" forIndexPath:indexPath];
    if ([cell isKindOfClass:[VideoViewCell class]]) {
        [(VideoViewCell *)cell layoutWithVideoConverURL:@"videoConver@2x" videoURL:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    cell.backgroundColor = [UIColor redColor];
    

    return cell;
}

#pragma mark -UICollectionViewDelegateFlowLayout's methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.row%3 == 0) {
        return CGSizeMake(self.view.bounds.size.width,self.view.bounds.size.width/16*9);
//
//    }
//    return CGSizeMake((self.view.bounds.size.width-20)/2, 300);
}


#pragma mark  - collectionView's delegate methods

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
