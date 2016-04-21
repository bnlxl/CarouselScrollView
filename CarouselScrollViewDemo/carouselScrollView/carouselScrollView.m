//
//  carouselScrollView.m
//  neeq_second
//
//  Created by 李轩霖 on 16/4/20.
//  Copyright © 2016年 TianXing. All rights reserved.
//

#import "carouselScrollView.h"

@interface carouselScrollView ()<UIScrollViewDelegate>

@property (nonatomic , assign) CGFloat allWidth;

@property (nonatomic , copy) UIView *firstImgV;

@property (nonatomic , copy) UIView *lastImgV;

@property (nonatomic , strong) NSArray<UIView*> *allView;

@end

@implementation carouselScrollView

-(void)open{
    if ([self.TXdelegate respondsToSelector:@selector(carouselScrollViewAddViewArray)]) {
        NSArray *arr = [self.TXdelegate carouselScrollViewAddViewArray];
        NSArray *arr2 = [self.TXdelegate carouselScrollViewAddViewArray];
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

//滚动即将结束时
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
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
////    if (self.contentOffset.x == self.lastImgV.width) {//滚动到第一个视图的时候
////        self.contentOffset = CGPointMake(self.allWidth, 0);
////    }
////    if (self.contentOffset.x == self.allWidth + self.lastImgV.width) {
////        self.contentOffset = CGPointMake(self.lastImgV.width, 0);
////    }
//    
//    
//}

/*
  根据 tableView cell 的循环引用的原理
  在用户停止拖拽时,将下一个 view 添加到 self 中,将上上个 view remove 掉
*/

//-(void)setImgViewArr:(NSArray<UIView *> *)imgViewArr{
//
//    if (imgViewArr) {
//        _imgViewArr = imgViewArr;
//        
//    }
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
