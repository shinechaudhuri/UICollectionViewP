//
//  TaskCollectionViewCell.m
//  testToDoList
//
//  Created by Shine Chaudhuri on 2015-10-12.
//  Copyright © 2015 Shine Chaudhuri. All rights reserved.
//

#import "TaskCollectionViewCell.h"

@implementation TaskCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.cellImageView = [[UIImageView alloc] initWithFrame:frame];
        self.cellImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.cellImageView.clipsToBounds = YES;
        [self addSubview:self.cellImageView];
    }
    return self;
}

@end
