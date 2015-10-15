//
//  TaskInfoViewController.m
//  testToDoList
//
//  Created by Shine Chaudhuri on 2015-10-13.
//  Copyright © 2015 Shine Chaudhuri. All rights reserved.
//

#import "TaskInfoViewController.h"

@interface TaskInfoViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextView *textView;

@end

@implementation TaskInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    CGFloat margin = 50;

    CGFloat width = (self.view.frame.size.width -margin -margin);
    
    //same dimensions as image in folder
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, margin, width, width)];
    
    imageView.image = self.image;
    self.imageView = imageView;
    [self.view addSubview:self.imageView];


    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(margin, 500, width, width)];
    textView.text = self.descript;
    NSLog(@"%@", self.descript);
    textView.editable = NO;
    [self.view addSubview:textView];
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
