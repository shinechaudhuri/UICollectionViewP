//
//  ToDoViewController.m
//  testToDoList
//
//  Created by Shine Chaudhuri on 2015-10-12.
//  Copyright © 2015 Shine Chaudhuri. All rights reserved.
//

#import "ToDoViewController.h"
#import "TaskCollectionView.h"
#import "TaskCollectionViewCell.h"
#import "TaskCollectionViewFlowLayout.h"
#import "TaskInfoViewController.h"
#import "Task.h"

@interface ToDoViewController ()

@property (nonatomic, strong) TaskCollectionView *taskCollectionView;
@property (nonatomic, strong) NSArray *photoFileNameArray;
@property (nonatomic, strong) NSString *sourcePath;
@property (nonatomic, strong) NSMutableArray *tasks;
@property (nonatomic , strong) NSArray *descrips;

- (void) setupCollectionView;
- (void) loadPictures;

@end

@implementation ToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Furniture ToDos";
    [self loadPictures];
    [self setupCollectionView];
}

    //Create Task model and create a Task array that contains image and description.
- (void) loadTask {
    self.tasks = [[NSMutableArray alloc]init];
    for (NSString *imageFileName in self.photoFileNameArray) {
        Task *task = [[Task alloc] init];
        task.descrip = imageFileName;
        task.image = [UIImage imageNamed:imageFileName];
        [self.tasks addObject:task];
    }
}

- (void) loadPictures {
    //save our path to the photos
    self.sourcePath = [[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:@"FurniturePictures"];
    //save photos to photoArray
    self.photoFileNameArray = [[NSFileManager defaultManager]contentsOfDirectoryAtPath:self.sourcePath error:NULL];
}

- (void) setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    self.taskCollectionView = [[TaskCollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    self.taskCollectionView.dataSource = self;
    self.taskCollectionView.delegate = self;
    
    //Registering cell class and preparing each for reuse
    [self.taskCollectionView registerClass:[TaskCollectionViewCell class] forCellWithReuseIdentifier:@"cellidentifier"];
    [self.taskCollectionView setBackgroundColor:[UIColor clearColor]];
    
    //Add collectionView as subview of root view
    [self.view addSubview:self.taskCollectionView];
    
    //setup identifier "taskCell"
    [self.taskCollectionView registerClass:[TaskCollectionViewCell class]forCellWithReuseIdentifier:@"taskCell"];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    //Create enough cells for each photo
    return [self.photoFileNameArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    

    NSString *imageName = [self.photoFileNameArray objectAtIndex:indexPath.row];
    NSString *fileName = [NSString stringWithFormat:@"%@/%@",self.sourcePath, imageName];
    
    //Setup our resuable cell object which has identifier "taskCell"
    TaskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"taskCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    //Put our images into image views
    UIImage *image = [UIImage imageWithContentsOfFile:fileName];
    
    cell.cellImageView.frame = cell.bounds;
    cell.cellImageView.image = image;
    
    
    //Add pics to cell as subview, in TaskCollectionViewCell create UIImageView *cellImageView

//    - (instancetype)initWithFrame:(CGRect)frame {
//        self = [super initWithFrame:frame];
//        if (self) {
//            self.cellImageView = [[UIImageView alloc] initWithFrame:frame];
//            self.cellImageView.contentMode = UIViewContentModeScaleAspectFill;
//            self.cellImageView.clipsToBounds = YES;
//            [self addSubview:self.cellImageView];
//        }
//        return self;

    
    NSLog(@"Number of subviews in cell: %ld", cell.subviews.count);
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat width = (self.view.bounds.size.width/2 -10);
    
    //make cell's width and height
    return CGSizeMake(width,width);
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}
    //separate sections
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10, 0, 10, 0);
    
}
    //select cell and go to Detail View Controller
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TaskInfoViewController *taskvc = [[TaskInfoViewController alloc]init];
    
    TaskCollectionViewCell *taskCell = (TaskCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    
    taskvc.image = taskCell.cellImageView.image;
    NSArray * arr = @[@"Drawer",@"Chest",@"Sofa"];
    taskvc.descript = arr[indexPath.row];
    NSLog(@"%@",taskvc.descript);
    
    [self.navigationController pushViewController:taskvc animated:YES];
    NSLog(@"%ld",indexPath.row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
