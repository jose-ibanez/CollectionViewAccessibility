//
//  JMICollectionViewCell.m
//  CollectionViewAccessibility
//
//  Created by Jose Ibanez on 4/29/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JMICollectionViewCell.h"

@implementation JMICollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        _label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.label.backgroundColor = [UIColor clearColor];
        self.label.textColor =[UIColor blackColor];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
    }
    return self;
}

- (BOOL)isAccessibilityElement {
    return YES;
}

- (NSString *)accessibilityLabel {
    return self.label.text;
}

- (void)accessibilityElementDidBecomeFocused {
    UICollectionView *collectionView = (UICollectionView *)self.superview;
    [collectionView scrollToItemAtIndexPath:[collectionView indexPathForCell:self] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally|UICollectionViewScrollPositionCenteredVertically animated:NO];
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, nil);
}

@end
