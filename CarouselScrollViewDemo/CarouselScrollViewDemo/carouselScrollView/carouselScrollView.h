

/*
 本 view 实现的内容
   原理:
 1.先将最后一个 view 添加到 self 的第0个 view 的位置上
 2.将所有 view 依次添加到 self 上
 3.将第一个 view 添加到最后一个 view 后面
 形成这样的 view 排列    4 1 2 3 4 1
 4.当滚动到最后一个时,将 self.contentoffset 改变到第1个位置
 5.当滚动到第0个时,将 self.contentoffset 改变为倒数第二个位置.
 附:scrollView 开启分页
    scrollView 关闭滚动条
 */

/*
 使用方法:
 1,代理中返回的数组是正常情况下你希望展示的每一页 view 的数组
 2,open 方法开启
 */

//代码很简单.功能很少,仅仅是一个可以分页循环无限滚动的 scrollView,其中的页面需要开发者在自己的页面加入
#import <UIKit/UIKit.h>

@protocol carouselScrollViewDelegate <NSObject>

-(NSArray<UIView*> *)carouselScrollViewAddViewArray;

@end

@interface carouselScrollView : UIScrollView

-(void)open;

@property (nonatomic , weak)id<carouselScrollViewDelegate> carDelegate;
@end
