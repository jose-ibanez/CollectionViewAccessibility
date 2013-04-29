#CollectionViewAccessibility

This is an example project demonstrating two issues I'm having with UICollectionView and UIAccessibility. I've posted both questions on StackOverflow [here](http://stackoverflow.com/questions/16289412/uicollectionview-section-headers-as-accessibility-headers) and [here](http://stackoverflow.com/questions/16289496/uicollectionviewflowlayout-voice-over-reads-items-out-of-order-with-flow-layout).

1. Voice Over will not jump to section headers that are not visible.
2. Voice Over will read items out of order based on the cell height.

This project creates a `UICollectionView` with 5 sections. Each section header returns `YES` for `isAccessibilityElement` and returns `UIAccessibilityTraitHeader` for `accessibilityTraits`. Each section has a random number of cells, between 10 and 20. Each cell has a randomized size, between 50x50 and 50x150.