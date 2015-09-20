//
//  ViewController.m
//  ZoomLayoutDemo
//
//  Created by 臧其龙 on 15/9/20.
//  Copyright © 2015年 臧其龙. All rights reserved.
//

#import "ViewController.h"
#import "TemplateFlowLayout.h"
#import "ImageCollectionViewCell.h"

static NSString * const kImageCollectionViewCellID = @"kImageCollectionViewCellID";

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *imageArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageArray = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        NSString *imageName = [NSString stringWithFormat:@"wuyanzu%d.jpg", i%3];
        UIImage *image = [UIImage imageNamed:imageName];
        [imageArray addObject:image];
    }
    
    TemplateFlowLayout *layout = [[TemplateFlowLayout alloc] init];
    [self.mCollectionView setCollectionViewLayout:layout];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CollectionView Datasource 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kImageCollectionViewCellID forIndexPath:indexPath];
    
    [cell.imageView setImage:imageArray[indexPath.item]];
    
    return cell;
}

@end
