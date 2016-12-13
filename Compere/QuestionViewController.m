//
//  QuestionViewController.m
//  Compere
//
//  Created by Kimi Wu on 12/13/16.
//  Copyright © 2016 Kimi Wu. All rights reserved.
//

#import "QuestionViewController.h"
#import "ViewConstants.h"
#import "QuestionSectionCell.h"

static NSString * const kHotCellIdentifier = @"hotCellIdentifier";
static NSString * const kRecentCellIdentifier = @"recentCellIdentifier";
@interface QuestionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCollectionView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpCollectionView
{
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:kQuestionSectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:kHotCellIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:kQuestionSectionCellIdentifier bundle:nil] forCellWithReuseIdentifier:kRecentCellIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    switch (indexPath.section) {
        case 0:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHotCellIdentifier forIndexPath:indexPath];
            if (!cell) {
                //init cell?
                //cell = [MessageCollectionViewCell alloc] initw
            }
            break;
        case 1:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:kRecentCellIdentifier forIndexPath:indexPath];
            [(QuestionSectionCell *)cell setSectionBackgroundColor:[UIColor lightGrayColor]];
            if (!cell) {
                //init cell?
                
            }
            break;
        default:
            cell = nil;
            break;
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.bounds), CGRectGetHeight(self.collectionView.bounds)/2);
}

@end