
#import "ViewController.h"
#import "carouselScrollView.h"

#define APP_WIDTH [UIScreen mainScreen].bounds.size.width
#define APP_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<carouselScrollViewDelegate>

@property (nonatomic , strong)carouselScrollView  *scroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.创建 且代理
    self.scroll = [[carouselScrollView alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, 500)];
    self.scroll.carDelegate = self;
    //2.执行一句关键的代码
    [self.scroll open];
    //3.添加到视图上
    [self.view addSubview:self.scroll];
}
//4.写你自己的视图
-(NSArray<UIView *> *)carouselScrollViewAddViewArray{

    NSMutableArray *marr = [NSMutableArray array];
    //X 和 Y 可以随意,carouselScrollView 会自动有序的添加
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,  APP_WIDTH, 500)];
    view.backgroundColor = [UIColor yellowColor];
    [marr addObject:view];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, 300)];
    label.backgroundColor = [UIColor blueColor];
    label.text = @"啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!啦啦啦啦啦啦啦啦德玛西亚!!!!";
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    [marr addObject:label];
    
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, 350)];
    imgV.image = [UIImage imageNamed:@"mao"];
    imgV.contentMode = UIViewContentModeCenter;
    [marr addObject:imgV];
    
    UIImageView *imgV2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, APP_WIDTH, 500)];
    imgV2.image = [UIImage imageNamed:@"meinv"];
//    imgV2.contentMode = UIViewContentModeCenter;
    [marr addObject:imgV2];
    
    return marr.copy;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
