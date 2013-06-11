//
//  JMIAccessibleCollectionView.m
//  CollectionViewAccessibility
//
//  Created by Ibanez, Jose on 6/11/13.
//  Copyright (c) 2013 Jose Ibanez. All rights reserved.
//

#import "JMIAccessibleCollectionView.h"

@implementation JMIAccessibleCollectionView

/* The container itself is not accessible, so MultiFacetedView should return NO in isAccessiblityElement. */
- (BOOL)isAccessibilityElement
{
    return NO;
}

/* The following methods are implementations of UIAccessibilityContainer protocol methods. */
- (NSInteger)accessibilityElementCount
{
    NSInteger count = 0;
    if (self.dataSource) {
        for (NSInteger section = 0; section < [self.dataSource numberOfSectionsInCollectionView:self]; section++) {
            count += [self.dataSource collectionView:self numberOfItemsInSection:section];
        }
    }    
    return count;
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
    NSInteger count = 0;
    if (self.dataSource) {
        for (NSInteger section = 0; section < [self.dataSource numberOfSectionsInCollectionView:self]; section++) {
            NSInteger items = [self.dataSource collectionView:self numberOfItemsInSection:section];
            if (index < count + items) {
                return [self cellForItemAtIndexPath:[NSIndexPath indexPathForItem:(index - count) inSection:section]];
            } else {
                count += items;
            }
        }
    }
    return nil;
}

- (NSInteger)indexOfAccessibilityElement:(id)element {
    NSIndexPath *indexPath = [self indexPathForCell:element];
    NSInteger index = 0;
    if (self.dataSource) {
        for (NSInteger section = 0; section < indexPath.section; section++) {
            index += [self.dataSource collectionView:self numberOfItemsInSection:section];
        }
        index += indexPath.row;
        return index;
    }
    return NSNotFound;
}

@end
