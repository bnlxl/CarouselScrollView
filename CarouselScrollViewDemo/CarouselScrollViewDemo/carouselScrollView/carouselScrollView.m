
#import "carouselScrollView.h"
#import "UIView+Extension.h"

@interface carouselScrollView ()<UIScrollViewDelegate>

@property (nonatomic , assign) CGFloat allWidth;

@property (nonatomic , strong) NSArray<UIView*> *allView;
@end

@implementation carouselScrollView

-(void)open{
    if ([self.carDelegate respondsToSelector:@selector(carouselScrollViewAddViewArray)]) {
        NSArray *arr = [self.carDelegate carouselScrollViewAddViewArray];
        NSArray *arr2 = [self.carDelegate carouselScrollViewAddViewArray];
        NSMutableArray *marr = [NSMutableArray array];
        [marr addObject:arr2.lastObject];
        for (UIView *view in arr) {
            [marr addObject:view];
        }
        [marr addObject:arr2.firstObject];
        self.allWidth = 0;
        self.allView = marr.copy;
        for (UIView *view in self.allView) {
            view.x = self.allWidth;
            [self addSubview:view];
            self.allWidth += view.width;
        }
        self.contentSize = CGSizeMake(self.allWidth, self.contentSize.height);
        UIView *NB1View = self.allView[1];
        self.contentOffset = CGPointMake(NB1View.x, 0);
        self.delegate = self;
    }
    self.pagingEnabled = YES;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
}

//滚动结束时
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    UIView *lastTwoView = self.allView[self.allView.count - 2];
    UIView *firstTowView = self.allView[1];
    UIView *lastView = self.allView[self.allView.count - 1];
    if (self.contentOffset.x == 0) {//滚动到第一个视图的时候
        self.contentOffset = CGPointMake(lastTwoView.x, 0);
    }
    if (self.contentOffset.x == lastView.x) {//滚动到最后一个视图的时候
        self.contentOffset = CGPointMake(firstTowView.x, 0);
    }
}

@end
